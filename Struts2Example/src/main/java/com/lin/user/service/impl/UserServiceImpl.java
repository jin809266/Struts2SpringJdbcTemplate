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
	public UserVo queryBySal(UserVo userVo) {
		return userdao.queryBySal(userVo);
	}

	@Override
	public int update(UserVo uservo) {
		UserVo vo = new UserVo();
		if(uservo.getComm().equals("")){
			vo.setComm(userdao.queryByhiredate(uservo.getHiredate()).getComm());
		}
		if(uservo.getSal().equals("")){
			vo.setSal(userdao.queryByhiredate(uservo.getHiredate()).getSal());
		}
		if(uservo.getDeptno().equals("")){
			vo.setDeptno(userdao.queryByhiredate(uservo.getHiredate()).getDeptno());
		}
		if(uservo.getJob().equals("")){
			vo.setJob(userdao.queryByhiredate(uservo.getHiredate()).getJob());
		}
		return userdao.update(uservo);
	}

}
