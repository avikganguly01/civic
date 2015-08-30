package org.casual.civic.exception;

import org.casual.civic.core.exception.AbstractResourceNotFoundException;

public class ConstituencyNotFoundException extends AbstractResourceNotFoundException {
	
	public ConstituencyNotFoundException() {
        super("error.msg.constituency.not.found", "Cannot find constituency");
    }

}
