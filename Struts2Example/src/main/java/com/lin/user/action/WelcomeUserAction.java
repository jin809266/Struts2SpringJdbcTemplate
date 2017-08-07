package com.lin.user.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import com.lin.user.model.UserVo;
import com.lin.user.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class WelcomeUserAction extends ActionSupport {
	// ActionSupport Implement Action so extends ActionSupport also is a Action
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserVo uservo;
	@Resource(name = "userService")
	private UserService userserivce;

	// all struts logic here
	public String execute() {
		return SUCCESS;
	}

	public String queryBtn() {
		if (StringUtils.isNotEmpty(uservo.getEname())) {
			setUservo(userserivce.queryByEname(uservo.getEname()));
		}
		if (uservo == null) {
			addActionError("查無資料");
			return execute();
		}
		return "queryBtn";
	}

	public UserVo getUservo() {
		return uservo;
	}

	public void setUservo(UserVo uservo) {
		this.uservo = uservo;
	}

}