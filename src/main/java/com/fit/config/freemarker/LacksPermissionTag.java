package com.fit.config.freemarker;

/**
 * <p>Equivalent to {@link org.apache.shiro.web.tags.LacksPermissionTag}</p>
 */
public class LacksPermissionTag extends PermissionTag {
    @Override
	protected boolean showTagBody(String p) {
        return !isPermitted(p);
    }
}
