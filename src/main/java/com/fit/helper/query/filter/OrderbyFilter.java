package com.fit.helper.query.filter;

/**
 * @author zhangjz
 * @version [v1.0.0, 2012-7-8]
 */
public class OrderbyFilter implements Filter {

    private String propertyName;

    private String orderDirection;

    public OrderbyFilter(String propertyName, String orderDirection) {
        this.propertyName = propertyName;
        this.orderDirection = orderDirection;
    }

    @Override
    public String toQueryString() {
        return propertyName + " " + orderDirection;
    }
}