package org.casual.civic.data;

import java.io.Serializable;

public class PoliticianData implements Serializable {

    private final Long id;
    private final String name;
    private final String constituencyName;
    private final String partyName;
    private final String education;
    private final Long criminalCasesPending;
    private final Long totalAssets;
    private final Long liabilities;

    public static PoliticianData instance(final Long id, final String name, final String constituencyName, final String partyName,
    		final String education, final Long criminalCasesPending, final Long totalAssets,
    		final Long liabilities) {
        return new PoliticianData(id, name, constituencyName, partyName,
        		education, criminalCasesPending, totalAssets, liabilities);
    }

    private PoliticianData(final Long id, final String name, final String constituencyName, final String partyName,
    		final String education, final Long criminalCasesPending, final Long totalAssets,
    		final Long liabilities) {
        this.id = id;
        this.name = name;
        this.constituencyName = constituencyName;
        this.partyName = partyName;
        this.education = education;
        this.criminalCasesPending = criminalCasesPending;
        this.totalAssets = totalAssets;
        this.liabilities = liabilities;
    }

	public String getName() {
		return name;
	}

	public Long getId() {
		return id;
	}

	public String getConstituencyName() {
		return constituencyName;
	}

	public String getPartyName() {
		return partyName;
	}

	public String getEducation() {
		return education;
	}

	public Long getCriminalCasesPending() {
		return criminalCasesPending;
	}

	public Long getTotalAssets() {
		return totalAssets;
	}

	public Long getLiabilities() {
		return liabilities;
	}
}
