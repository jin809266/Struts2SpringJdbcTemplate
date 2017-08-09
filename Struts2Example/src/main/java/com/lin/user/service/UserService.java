package com.lin.user.service;

import java.util.List;

import com.lin.user.model.UserVo;

public interface UserService {

	public UserVo queryByEname(String ename);
	
	public List<UserVo> queryByJob(String job);
	
	public void deleteByDeptNo(String deptno);
	
	public UserVo queryBySal(String sal);

}
