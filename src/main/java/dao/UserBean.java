package dao;

public class UserBean {
    private String userId;
    private String userpassword;
    private Integer Permission;

    /**
     * Gets the value of userId.
     *
     * @return the value of userId
     */

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * Gets the value of userpassword.
     *
     * @return the value of userpassword
     */

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    /**
     * Gets the value of Permission.
     *
     * @return the value of Permission
     */

    public Integer getPermission() {
        return Permission;
    }

    public void setPermission(Integer permission) {
        Permission = permission;
    }
}
