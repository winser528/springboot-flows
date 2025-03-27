package com.fit.web;

import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fit.config.shiro.UserManager;
import com.fit.entity.Log;
import com.fit.helper.config.ConfigHelper;
import com.fit.helper.config.LogNode;
import com.fit.service.LogService;
import com.fit.util.DateUtils;
import com.fit.util.StringUtils;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * Interceptor - 日志记录
 *
 * @author Team
 * @version 3.0
 */
@SuppressWarnings({"unused"})
public class LogInterceptor extends HandlerInterceptorAdapter {

    /**
     * 默认忽略参数
     */
    private static final String[] DEFAULT_IGNORE_PARAMETERS = new String[]{"password", "rePassword", "currentPassword"};

    /**
     * 忽略参数
     */
    private String[] ignoreParameters = DEFAULT_IGNORE_PARAMETERS;

    @Autowired
    private LogService logService;
    @Autowired
    private UserManager userService;

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        Map<String, LogNode> logConfigs = ConfigHelper.getLogConfigs();
        String username = userService.getUsername();
        if (logConfigs != null && StringUtils.isNotBlank(username)) {
            HttpServletRequest req = request;
            String uri = req.getRequestURI().split("[?]")[0];
            String[] strs = uri.split("[\\/\\.]");
            if (strs.length < 2) {
                return;
            }
            String perm = strs[strs.length - 2];

            if (logConfigs.containsKey(perm)) {
                StringBuffer param = new StringBuffer();
                Map<String, String[]> parameterMap = request.getParameterMap();
                if (parameterMap != null) {
                    for (Entry<String, String[]> entry : parameterMap.entrySet()) {
                        String parameterName = entry.getKey();
                        if (!ArrayUtils.contains(ignoreParameters, parameterName)) {
                            String[] parameterValues = entry.getValue();
                            if (parameterValues != null) {
                                for (String parameterValue : parameterValues) {
                                    param.append(parameterName + " = " + parameterValue + "\n");
                                }
                            }
                        }
                    }
                }
                LogNode logConfig = logConfigs.get(perm);
                Log log = new Log();
                log.setLogType(0);
                log.setName(logConfig.getName());
                log.setUsername(username);
                log.setCreateTime(DateUtils.getCurrentTime(null));
                log.setContent(param.toString());
                log.setIp(request.getRemoteAddr());
                // logService.save(log);
            }
        }
    }

    /**
     * 设置忽略参数
     *
     * @return 忽略参数
     */
    public String[] getIgnoreParameters() {
        return ignoreParameters;
    }

    /**
     * 设置忽略参数
     *
     * @param ignoreParameters 忽略参数
     */
    public void setIgnoreParameters(String[] ignoreParameters) {
        this.ignoreParameters = ignoreParameters;
    }

}