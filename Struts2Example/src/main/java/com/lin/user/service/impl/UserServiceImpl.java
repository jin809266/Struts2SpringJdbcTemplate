package com.lin.user.service.impl;

import javax.annotation.Resource;
import com.lin.user.dao.UserDao;
import com.lin.user.model.UserVo;
import com.lin.user.service.UserService;

public class UserServiceImpl implements UserService {
	// @Resource name = "userDao" matched --> application.xml <bean id =
	// "userDao" class="com.lin.user.dao.impl.UserDaoImpl"/>
	// ref UserDaoImpl
	@Resource(name = "userDao")
	private UserDao userdao;

	@Override
	public UserVo queryByEname(String ename) {
		return userdao.queryByEname(ename);
	}

}
