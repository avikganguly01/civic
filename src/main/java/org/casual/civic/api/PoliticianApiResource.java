package org.casual.civic.api;

import java.util.Collection;

import org.casual.civic.core.infra.ApiSerializer;
import org.casual.civic.core.infra.CommandProcessingResult;
import org.casual.civic.core.infra.FromJsonHelper;
import org.casual.civic.core.infra.JsonCommand;
import org.casual.civic.data.PoliticianData;
import org.casual.civic.service.PoliticianReadPlatformService;
import org.casual.civic.service.PoliticianWritePlatformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonParser;

@RestController  
@RequestMapping("/politicians") 
public class PoliticianApiResource {
	
	private final PoliticianReadPlatformService politicianReadPlatformService;
	private final PoliticianWritePlatformServiceImpl politicianWritePlatformService;
	private final ApiSerializer<PoliticianData> jsonSerializer;
	private final FromJsonHelper fromApiJsonHelper;
	
	@Autowired
    public PoliticianApiResource(final PoliticianReadPlatformService politicianReadPlatformService,
    		final PoliticianWritePlatformServiceImpl politicianWritePlatformService,
    		final ApiSerializer<PoliticianData> jsonSerializer,
    		final FromJsonHelper fromApiJsonHelper) {
		this.politicianReadPlatformService = politicianReadPlatformService;
		this.politicianWritePlatformService = politicianWritePlatformService;
		this.jsonSerializer = jsonSerializer;
		this.fromApiJsonHelper = fromApiJsonHelper;
	}
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrievePoliticians() {
        final Collection<PoliticianData> politicians = this.politicianReadPlatformService.retrieveAll();
        return this.jsonSerializer.serialize(politicians);
    }
	
	@RequestMapping(value = "/latlong", method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrievePoliticiansByLatLong(@RequestParam("lat") final double latitude,
    		@RequestParam("long") final double longitude) {
        final Collection<PoliticianData> politicians = this.politicianReadPlatformService.retrieveByLatLong(latitude,
        		longitude);
        return this.jsonSerializer.serialize(politicians);
    }
	
	@RequestMapping(value = "/geocode", method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrievePoliticiansByGeocoding(@RequestParam("address") final String address) {
        final Collection<PoliticianData> politicians = this.politicianReadPlatformService.retrieveByAddress(address);
		return this.jsonSerializer.serialize(politicians);
    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrievePolitician(@PathVariable("id") long politicianId) {
        final PoliticianData politician = this.politicianReadPlatformService.retrieveOne(politicianId);
        return this.jsonSerializer.serialize(politician);
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
    public CommandProcessingResult createPolitician(@RequestBody final  String politician) {
		return this.politicianWritePlatformService.createPolitician(JsonCommand.from(politician,
				new JsonParser().parse(politician), fromApiJsonHelper));
    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT, produces = "application/json; charset=utf-8")
	@ResponseBody
    public CommandProcessingResult updatePolitician(@PathVariable("id") long politicianId,
    		@RequestBody final  String politician) {
		return this.politicianWritePlatformService.updatePolitician(politicianId,
				JsonCommand.from(politician, new JsonParser().parse(politician),
						fromApiJsonHelper));

    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "application/json; charset=utf-8")
	@ResponseBody
    public CommandProcessingResult deletePolitician(@PathVariable("id") long politicianId) {
		return this.politicianWritePlatformService.deletePolitician(politicianId);

    }

}
