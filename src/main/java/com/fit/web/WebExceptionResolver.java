package com.fit.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fit.config.shiro.UserManager;
import com.fit.entity.Log;
import com.fit.service.LogService;
import com.fit.util.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@SuppressWarnings({"unused"})
public class WebExceptionResolver implements HandlerExceptionResolver {
    private Logger logger = LoggerFactory.getLogger(Object.class);

    @Autowired
    private LogService logService;
    @Autowired
    private UserManager userService;

    @Override
    public ModelAndView resolveException(HttpServletRequest req, HttpServletResponse resp, Object object, Exception e) {

        String errorCode = DateUtils.getCurrentTime("yyyyMMddHHmmssSSS");
        logger.error("errorCode:" + errorCode, e);

        Log log = new Log();
        log.setLogType(1);
        log.setName("系统异常");
        log.setContent("异常码:" + errorCode);
        log.setUsername(userService.getUsername());
        log.setCreateTime(DateUtils.getCurrentTime(null));
        log.setIp(req.getRemoteAddr());
        // logService.save(log);

        ModelAndView mv = new ModelAndView("admin/common/error");
        mv.addObject("errorCode", errorCode);
        return mv;
    }
}