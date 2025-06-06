package com.fit.config.freemarker;

import freemarker.template.SimpleHash;

/**
 * Shortcut for injecting the tags into Freemarker
 *
 * <p>Usage: cfg.setSharedVeriable("shiro", new ShiroTags());</p>
 */
public class FreemarkerShiroTags extends SimpleHash {
	
	private static final long serialVersionUID = 1L;

	public FreemarkerShiroTags() {
        put("authenticated", new AuthenticatedTag());
        put("guest", new GuestTag());
        put("hasAnyRoles", new HasAnyRolesTag());
        put("hasPermission", new HasPermissionTag());
        put("hasRole", new HasRoleTag());
        put("lacksPermission", new LacksPermissionTag());
        put("lacksRole", new LacksRoleTag());
        put("notAuthenticated", new NotAuthenticatedTag());
        put("principal", new PrincipalTag());
        put("user", new UserTag());
    }
}