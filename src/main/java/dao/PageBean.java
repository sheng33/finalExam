package dao;



import java.util.List;


/**
 * 封装分页的参数
 *
 * @author Jie.Yuan
 *
 */
public class PageBean {
    private List<siteBean> records;// 记录
    private Long totalrecordnumber;// 总记录数
    private Integer startindex;// 第一页
    private Integer endindex;// 最后一页
    private Integer totalpagenumber;// 总页数
    private Integer currentpage;// 当前页
    public PageBean(List<siteBean> records, Long totalrecordnumber, int currentpage,
                    int maximum, int viewperpage)
    // 构造函数
    {
        this.totalrecordnumber = totalrecordnumber;
        this.currentpage = currentpage;
        totalpagenumber = (int) (totalrecordnumber % maximum == 0 ? totalrecordnumber
                / maximum
                : totalrecordnumber / maximum + 1);//获得总页数
        setIndex(currentpage, viewperpage, totalpagenumber);
    }

    public Long getTotalrecordnumber() {
        return totalrecordnumber;
    }
    public Integer getStartindex() {
        return startindex;
    }
    public Integer getEndindex() {
        return endindex;
    }
    public Integer getTotalpagenumber() {
        return totalpagenumber;
    }
    public Integer getCurrentpage() {
        return currentpage;
    }
    //获得总页数 显示页数 当前页数 第一页 最后一页

    @Override
    public String toString() {
        return "PageBean{" +
                "records=" + records +
                ", totalrecordnumber=" + totalrecordnumber +
                ", startindex=" + startindex +
                ", endindex=" + endindex +
                ", totalpagenumber=" + totalpagenumber +
                ", currentpage=" + currentpage +
                '}';
    }

    public void setIndex(int currentpage, int viewperpage, int totalpagenumber) {
        if (viewperpage >= totalpagenumber) {
            startindex = 1;
            endindex = totalpagenumber;
        } else {
            if (currentpage <= viewperpage / 2) {
                startindex = 1;
                endindex = viewperpage;
            } else if ((currentpage + viewperpage / 2) > totalpagenumber) {
                startindex = totalpagenumber - viewperpage + 1;
                endindex = totalpagenumber;
            } else {
                startindex = currentpage - (viewperpage - 1) / 2;
                endindex = currentpage + viewperpage / 2;
            }
        }
    }
}