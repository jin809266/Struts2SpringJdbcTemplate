package com.lin.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
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
	public UserVo queryBySal(UserVo userVo) {
		if(StringUtils.isEmpty(String.valueOf(userVo.getSal())) || userVo.getSal() == null){
			userVo.setSal(userdao.queryByhiredate(userVo.getHiredate()).getSal());
		}
		return userdao.queryBySal(userVo);
	}

	@Override
	public int update(UserVo uservo) {
		if(StringUtils.isEmpty(String.valueOf(uservo.getComm())) || uservo.getComm() == null){
			uservo.setComm(0);
		}
		if(StringUtils.isEmpty(String.valueOf(uservo.getSal())) || uservo.getSal() == null){
			uservo.setSal(0);
		}
		if(StringUtils.isEmpty(String.valueOf(uservo.getDeptno())) || uservo.getDeptno() == null){
			uservo.setDeptno(userdao.queryByhiredate(uservo.getHiredate()).getDeptno());
		}
		if(StringUtils.isEmpty(uservo.getJob()) || uservo.getJob() == null){
			uservo.setJob("");
		}
		return userdao.update(uservo);
	}

}
