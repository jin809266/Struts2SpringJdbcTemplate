package com.lin.user.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.util.CollectionUtils;

import com.lin.user.model.UserVo;
import com.lin.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WelcomeUserAction extends ActionSupport {
	// ActionSupport Implement Action so extends ActionSupport also is a Action
	private static final long serialVersionUID = 1L;
	@Resource(name = "userService")
	private UserService userserivce;
	private UserVo userVo;
	private List<UserVo> userList;
	private final static String QUERY_BY_ENAME = "queryByEname";
	private final static String QUERY_BY_JOB = "queryByJob";
	private final static String DELETE_BY_DEPTNO = "deleteByDeptno";
	private final static String EDIT = "edit";
	private final static String UPDATE = "update";
	private final static String PREVIOUSPAGE = "previousPage";

	// all struts logic here
	public String execute() {
		return SUCCESS;
	}

	public void initialData() {
		// some view data prepare in this
	}

	public String queryByEname() {
		if (StringUtils.isNotEmpty(userVo.getEname())) {
			setUserVo(userserivce.queryByEname(userVo.getEname()));
		}
		if (userVo == null) {
			addActionError("查無資料");
			return execute();
		}
		return QUERY_BY_ENAME;
	}

	public String queryByJob() {
		if (StringUtils.isNotEmpty(userVo.getJob())) {
			setUserList(userserivce.queryByJob(userVo.getJob()));
		}
		if (CollectionUtils.isEmpty(userList)) {
			addActionError("查無資料");
			return execute();
		}
		return QUERY_BY_JOB;
	}

	public String deleteByDeptno() {
		userserivce.deleteByDeptNo(String.valueOf(userVo.getDeptno()));
		addActionMessage("已刪除");
		return DELETE_BY_DEPTNO;
	}

	public String edit() {
		setUserVo(userserivce.queryBySal(userVo));
		if (userVo == null) {
			addActionError("查無資料");
			return execute();
		}
		return EDIT;
	}

	public String update() {
		userserivce.update(userVo);
		addActionMessage("已修改");
		// confirm return updated Data Access Object
		setUserVo(userserivce.queryBySal(userVo));
		if (userVo == null) {
			addActionError("查無資料");
			return execute();
		}
		return UPDATE;
	}

	public String previousPage() {
		return PREVIOUSPAGE;
	}

	// future create common class method
	public String getActionMethodName() {
		return ActionContext.getContext().getActionInvocation().getProxy().getMethod();
	}

	public List<UserVo> getUserList() {
		return userList;
	}

	public void setUserList(List<UserVo> userList) {
		this.userList = userList;
	}

	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

}