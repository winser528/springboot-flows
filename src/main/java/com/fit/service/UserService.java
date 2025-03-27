package com.fit.service;

import com.fit.dao.CommonDao;
import com.fit.entity.Org;
import com.fit.entity.User;
import com.fit.helper.query.QueryFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseService<User> {

    @Autowired
    private CommonDao<User> userDao;

    public User findLeader(Long userId) {
        User user = userDao.findById(userId, User.class);
        Org org = null;
        if (Org.TYPE_POSITION.equals(user.getOrg().getParentOrg().getType())) {
            org = user.getOrg().getParentOrg();
        } else {
            org = user.getOrg().getParentOrg().getParentOrg();
        }

        QueryFilter filter = QueryFilter.newFilter().eq("org.id", org.getId());
        return userDao.findByFilter(filter, User.class);
    }
}