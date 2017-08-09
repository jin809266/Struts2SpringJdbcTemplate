package com.lin.user.dao;

import java.util.List;

import com.lin.user.model.UserVo;

public interface UserDao {

	public UserVo queryByEname(String ename);
	
	public List<UserVo> queryByJob(String job);
	
	public void deleteByDeptNo(String deptno);

	public UserVo queryBySal(String sal);
}
