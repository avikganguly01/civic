package org.casual.civic.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.casual.civic.data.PoliticianData;
import org.casual.civic.exception.ConstituencyNotFoundException;
import org.casual.civic.exception.PoliticianNotFoundException;
import org.casual.civic.utils.ProcessorHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import retrofit.client.Response;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class PoliticianReadPlatformServiceImpl {

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private PoliticianReadPlatformServiceImpl(DataSource dataSource) {
	    this.jdbcTemplate = new JdbcTemplate();
	    this.jdbcTemplate.setDataSource(dataSource);
	}
	
	public List<PoliticianData> retrieveAll() {
		final PoliticianMapper pm = new PoliticianMapper();
        final String sql = "select " + pm.schema() + " order by p.name";

        return this.jdbcTemplate.query(sql, pm, new Object[] {});
	}
	
	public List<PoliticianData> retrieveByLatLong(final double latitude, final double longitude) {
		final PoliticianMapper pm = new PoliticianMapper();
        final String sql = "select " + pm.schema() + " inner join c_assemblies cpo on cpo.objectid=cc.polygon_id " +
        		" where cpo.objectid = (select cpoo.objectid from c_assemblies cpoo where st_contains(cpoo.`the_geom`, point(?, ?))) order by p.name";

        return this.jdbcTemplate.query(sql, pm, new Object[] {longitude, latitude});
	}
	
	public List<PoliticianData> retrieveByAddress(final String address) {
		try {
			final GeocodingService service = ProcessorHelper
					.createWebHookService("https://maps.googleapis.com/maps/api/geocode");
			final Map<String, String> queryParams = new HashMap<String, String> ();
			queryParams.put("address", address);
			queryParams.put("bounds", "28.3247893,76.7824797|28.9184529,77.3331994");
			
			String sql = "select `key` from c_api_keys limit 1";
	        final List<String> apiKeys = this.jdbcTemplate.queryForList(sql, String.class);
	        final String geocodingApiKey =  apiKeys.get(0);
	        queryParams.put("key", geocodingApiKey);
			
			final Response response = service.sendRequestWithBounds(queryParams);
			final JsonObject location = new JsonParser().parse(ProcessorHelper.getResponse(response)).getAsJsonObject()
			.get("results").getAsJsonArray().get(0).getAsJsonObject().get("geometry")
			.getAsJsonObject().get("location").getAsJsonObject();
			final double lat = location.get("lat").getAsDouble();
			final double longitude = location.get("lng").getAsDouble();
			final PoliticianMapper pm = new PoliticianMapper();
	        sql = "select " + pm.schema() + " inner join c_assemblies cpo on cpo.objectid=cc.polygon_id " +
	        		" where cpo.objectid = (select cpoo.objectid from c_assemblies cpoo where st_contains(cpoo.`the_geom`, point(?, ?))) order by p.name";

	        return this.jdbcTemplate.query(sql, pm, new Object[] {longitude, lat});
		} catch (Exception e) {
			e.printStackTrace();
			throw new ConstituencyNotFoundException();
		}
	}
	
	public String retrieveApiKey(int index) {
		String sql = "select `key` from c_api_keys";
        final List<String> apiKeys = this.jdbcTemplate.queryForList(sql, String.class);
        return apiKeys.get(index);
	}
	
	public PoliticianData retrieveOne(final Long politicianId) {
		try {
			final PoliticianMapper pm = new PoliticianMapper();
	        final String sql = "select " + pm.schema() + " where p.id=? order by p.name";
	
	        return this.jdbcTemplate.queryForObject(sql, pm, new Object[] {politicianId});
		} catch (EmptyResultDataAccessException exception) {
			throw new PoliticianNotFoundException(politicianId);
		}
	}
	
	private static final class PoliticianMapper implements RowMapper<PoliticianData> {

        public String schema() {
            return " p.id as id, p.name, cc.`name` as constituencyName, cp.`abbreviation` as partyName, p.`criminal_cases_pending`, p.`education`, p.`totalAssets`, p.`liabilities`," +
            	   " p.address, p.email, p.contact, p.ipc from c_politician p inner join c_party cp on p.`party_id`=cp.`id`" +
            	   " inner join c_constituency cc on cc.`id`=p.`constituency_id` ";
        }

        @Override
        public PoliticianData mapRow(final ResultSet rs, @SuppressWarnings("unused") final int rowNum) throws SQLException {

            final Long id = rs.getLong("id");
            final String name = rs.getString("name");
            final String constituencyName = rs.getString("constituencyName");
            final String partyName = rs.getString("partyName");
            final String education = rs.getString("education");
            final Long criminalCasesPending = rs.getLong("criminal_cases_pending");
            final Long totalAssets = rs.getLong("totalAssets");
            final Long liabilities = rs.getLong("liabilities");
            final String address = rs.getString("address");
            final String email = rs.getString("email");
            final String contact = rs.getString("contact");
            final String ipc = rs.getString("ipc");

            return PoliticianData.instance(id, name, constituencyName, partyName,
            		education, criminalCasesPending, totalAssets, liabilities,
            		address, email, contact, ipc);
        }
    }

}
