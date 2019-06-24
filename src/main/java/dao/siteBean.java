package dao;

public class siteBean {
    Integer siteId;
    String siteName;

    public siteBean() {
    }

    public siteBean(Integer siteId, String siteName) {
        this.siteId = siteId;
        this.siteName = siteName;
    }

    /**
     * Gets the value of siteId.
     *
     * @return the value of siteId
     */

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    /**
     * Gets the value of siteName.
     *
     * @return the value of siteName
     */

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }
}
