package com.lin.user.dao;

import com.lin.user.model.UserVo;

public interface UserDao {

	public UserVo queryByEname(String ename);
}
