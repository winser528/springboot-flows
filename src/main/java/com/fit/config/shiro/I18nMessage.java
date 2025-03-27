package com.fit.config.shiro;

import freemarker.template.SimpleScalar;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Locale;

/**
 * @AUTO
 * @Author AIM
 * @DATE 2025/1/15
 */
@Component("i18nMessage")
public class I18nMessage implements TemplateMethodModel {

    @Lazy
    @Autowired
    private MessageSource messageSource;

    /**
     * 获取国际化消息
     *
     * @param code 代码
     * @param args 参数
     * @return 国际化消息
     */
    public String getMessage(String code, Object... args) {
        // 从 MessageSource 中获取国际化消息
        return messageSource.getMessage(code, args, Locale.getDefault());
    }

    @Override
    public Object exec(List list) throws TemplateModelException {
        if (list != null && list.size() > 0) {
            String message = null;
            String code = list.get(0).toString();
            if (list.size() > 1) {
                Object[] args = list.subList(1, list.size()).toArray();
                message = getMessage(code, args);
            } else {
                message = getMessage(code);
            }
            return new SimpleScalar(message);
        }
        return null;
    }
}