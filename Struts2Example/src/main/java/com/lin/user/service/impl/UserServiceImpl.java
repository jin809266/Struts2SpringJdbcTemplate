package com.lin.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<UserVo> queryByJob(String job) {
		return userdao.queryByJob(job);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteByDeptNo(String deptno) {
		userdao.deleteByDeptNo(deptno);
	}

	@Override
	public UserVo queryBySal(String sal) {
		return userdao.queryBySal(sal);
	}

}
