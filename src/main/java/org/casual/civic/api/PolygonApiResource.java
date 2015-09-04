package org.casual.civic.api;

import java.util.List;

import org.casual.civic.core.infra.ApiSerializer;
import org.casual.civic.data.PolygonData;
import org.casual.civic.service.PolygonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController  
@RequestMapping("/polygon") 
public class PolygonApiResource {
	
	private final PolygonServiceImpl polygonServiceImpl;
	private final ApiSerializer<PolygonData> jsonSerializer;
	
	@Autowired
    public PolygonApiResource(final PolygonServiceImpl polygonServiceImpl,
    		final ApiSerializer<PolygonData> jsonSerializer) {
		this.polygonServiceImpl = polygonServiceImpl;
		this.jsonSerializer = jsonSerializer;
	}
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrievePolygons() {
		final List<PolygonData> polygons = this.polygonServiceImpl.retrieveAll();
		return this.jsonSerializer.serialize(polygons);
    }

}
