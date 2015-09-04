package org.casual.civic.api;

import java.util.ArrayList;
import java.util.List;

import org.casual.civic.core.infra.ApiSerializer;
import org.casual.civic.data.PoliticianData;
import org.casual.civic.service.PoliticianReadPlatformServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController  
@RequestMapping("/key") 
public class APIKeyResource {
	
	private final PoliticianReadPlatformServiceImpl politicianReadPlatformService;
	private final ApiSerializer<PoliticianData> jsonSerializer;
	
	@Autowired
    public APIKeyResource(final PoliticianReadPlatformServiceImpl politicianReadPlatformService,
    		final ApiSerializer<PoliticianData> jsonSerializer) {
		this.politicianReadPlatformService = politicianReadPlatformService;
		this.jsonSerializer = jsonSerializer;
	}

	@RequestMapping(value = "/maps", method = RequestMethod.GET, produces = "application/json; charset=utf-8")  
	@Transactional(readOnly = true)
    public String retrieveMapsAPIKey() {
		final List<PoliticianData> list = new ArrayList<>();
		list.add(PoliticianData.nameInstance(this.politicianReadPlatformService.retrieveApiKey(1)));
		return this.jsonSerializer.serialize(list);
    }
}
