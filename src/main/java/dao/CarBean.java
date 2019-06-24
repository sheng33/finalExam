package dao;

public class CarBean {
    private String carId;
    private String licensePlate;
    private String carPath;
    private String startSite;
    private String endSite;

    public CarBean(String carId, String licensePlate, String carPath, String startSite, String endSite) {
        this.carId = carId;
        this.licensePlate = licensePlate;
        this.carPath = carPath;
        this.startSite = startSite;
        this.endSite = endSite;
    }

    public CarBean() {
    }

    @Override
    public String toString() {
        return "CarBean{" +
                "carId='" + carId + '\'' +
                ", licensePlate='" + licensePlate + '\'' +
                ", carPath='" + carPath + '\'' +
                ", startSite='" + startSite + '\'' +
                ", endSite='" + endSite + '\'' +
                '}';
    }

    /**
     * Gets the value of startSite.
     *
     * @return the value of startSite
     */

    public String getStartSite() {
        return startSite;
    }

    public void setStartSite(String startSite) {
        this.startSite = startSite;
    }

    /**
     * Gets the value of endSite.
     *
     * @return the value of endSite
     */

    public String getEndSite() {
        return endSite;
    }

    public void setEndSite(String endSite) {
        this.endSite = endSite;
    }

    /**
     * Gets the value of carId.
     *
     * @return the value of carId
     */

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    /**
     * Gets the value of licensePlate.
     *
     * @return the value of licensePlate
     */

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    /**
     * Gets the value of carPath.
     *
     * @return the value of carPath
     */

    public String getCarPath() {
        return carPath;
    }

    public void setCarPath(String carPath) {
        this.carPath = carPath;
    }
}
