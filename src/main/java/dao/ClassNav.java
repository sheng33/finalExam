package dao;

public class ClassNav {
    private Integer classId;
    private String className;
    private String classUrl;

    /**
     * Gets the value of classUrl.
     *
     * @return the value of classUrl
     */

    public String getClassUrl() {
        return classUrl;
    }

    public void setClassUrl(String classUrl) {
        this.classUrl = classUrl;
    }

    @Override
    public String toString() {
        return "ClassNav{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                '}';
    }

    /**
     * Gets the value of classId.
     *
     * @return the value of classId
     */

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    /**
     * Gets the value of className.
     *
     * @return the value of className
     */

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
