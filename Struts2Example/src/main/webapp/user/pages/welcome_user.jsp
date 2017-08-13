<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style>
table, th, td{
 border: 1px solid black;
 text-align:center;
}
</style>
<!-- <s:url value=""/> is struts2 ONGL syntax -->
<link href="<s:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// clean query by ename
	$("#cleanByEname").click(function(){
		$("#job").html('');
		$("#hiredate").html('');
		$("#sal").html('');
		$("#comm").html('');
		$("#deptno").html('');
	});
	// delete by deptno
	$("#deleteByEname").click(function(){
		var deptno = $("#deptno").html();
		$("#deptno").val(deptno);
		$("form").attr("action","Welcome!deleteByDeptno").submit();
	});
	
	$(".editBtn").click(function(){
		var index = $(this).attr('index');
		var job = $("#job_"+index).html();
		var hiredate = $("#hiredate_"+index).html();
		var sal = $("#sal_"+index).html();
		var comm = $("#comm_"+index).html();
		var deptno = $("#deptno_"+index).html();
		$("#deptno").val(deptno);
		$("#job").val(job);
		$("#hiredate").val(hiredate);
		$("#sal").val(sal);
		$("#comm").val(comm);
		var url = 'Welcome!edit.action';
		var queryString = $("#form1").serialize();
		$.post(url,queryString,
	    function(data){
		$("#testA").show();
		$("#job1").val(data.userVo.job);
		$("#checkUpdate").html(data.userVo.hiredate);
		$("#sal1").val(data.userVo.sal);
		$("#comm1").val(data.userVo.comm);
		$("#deptno1").val(data.userVo.deptno);
		},"json");
	});
	
	$("#updateBtn").click(function(){
		var job = $.trim($("#job1").val());
		var hiredate = $("#checkUpdate").html();
		var sal = $.trim($("#sal1").val());
		var comm = $.trim($("#comm1").val());
		var deptno = $.trim($("#deptno1").val());
		$("#job").val(job);
		$("#hiredate").val(hiredate);
		$("#sal").val(sal);
		$("#comm").val(comm);
		$("#deptno").val(deptno);
		$("form").attr("action","Welcome!update").submit();
	});
	
	$("#previousPage").click(function(){
		$("form").attr("action","Welcome!previousPage").submit();
	});
	
	$(".previousPage").click(function(){
		$("form").attr("action","Welcome!previousPage").submit();
	});
	
	$("#displayNoneBtn").click(function(){
		$("#testA").hide();
	})
	
});

</script>
</head>
<body background="<s:url value="/image/blueGround.jpg"/>">
<br/>
<br/>
<div><h1>查詢結果</h1></div>
<!-- Msg Start -->
<s:if test="hasActionMessages()">
   <div class="cssClass">
      <s:actionmessage/>
   </div>
</s:if>
<!-- Msg End -->
	 <table width="98%">
	   <thead>
	   	 <tr>
	   	   <th>JOB</th>
	   	   <th>HIREDATE</th>
	   	   <th>SAL</th>
	   	   <th>COMM</th>
	   	   <th>DEPTNO</th>
	   	   <th></th>
	   	   <if test='actionMethodName.equals("queryByJob")'>
	   	   <th></th>
	   	   </if> 
	   	   <!-- final return update && queryByEname actionMethodName -->
	   	   <s:if test='actionMethodName.equals("update") || actionMethodName.equals("queryByEname")'>
	   	   <th></th>
	   	   <th></th>
	   	   </s:if>
	   	 </tr>
	   </thead>
	   <tbody>
	  		  <s:if test='actionMethodName.equals("queryByEname") || actionMethodName.equals("update")'>
	       	  <tr>
		      <td width="13%" id="job"><s:property value="userVo.job" /></td>
		      <td width="16%" id="hiredate"><s:property value="userVo.hiredate" /></td>
		      <td width="14%" id="sal"><s:property value="userVo.sal" /></td>
		      <td width="12%" id="comm"><s:property value="userVo.comm" /></td>
		      <td width="10%" id="deptno"><s:property value="userVo.deptno" /></td>
		      <td width="15%"><input type="button" class="btn-primary" id="cleanByEname" value="清除"></td>
		      <td width="15%"><input type="button" class="btn-primary" id="deleteByEname" value="刪除"></td>
		      <td width="15%"><input type="button" class="btn-primary" id="previousPage" value="回上一頁"></td>
		      </tr>
		      </s:if>
		      <s:elseif test='"queryByJob".equals(actionMethodName)'>
		      <s:iterator value="userList" status="s" var="r">
		      <tr <s:if test="#s.odd == true ">style="background-color:#CCC"</s:if><s:else>style="background-color:grey"</s:else>>
		      <td width="13%" index='<s:property value="#s.index"/>' id='job_<s:property value="#s.index"/>'><s:property value="#r.job" /></td>
		      <td width="16%" index='<s:property value="#s.index"/>' id='hiredate_<s:property value="#s.index"/>'><s:property value="#r.hiredate" /></td>
		      <td width="14%" index='<s:property value="#s.index"/>' id='sal_<s:property value="#s.index"/>'><s:property value="#r.sal" /></td>
		      <td width="12%" index='<s:property value="#s.index"/>' id='comm_<s:property value="#s.index"/>'><s:property value="#r.comm" /></td>
		      <td width="10%" index='<s:property value="#s.index"/>' id='deptno_<s:property value="#s.index"/>'><s:property value="#r.deptno" /></td>
		      <td width="15%"><input type="button" index='<s:property value="#s.index"/>' class="editBtn btn-primary" value="編輯"></td>
		      <td width="15%"><input type="button" class="btn-primary previousPage" id="" value="回上一頁"></td>
		      </tr>
		      </s:iterator>
		      </s:elseif>
		</tbody>
	</table>
	<br/>
	<form action="" method="post" id="form1">
	<input type="hidden" id="deptno" name="userVo.deptno" value=""/>
	<input type="hidden" id="job" name="userVo.job" value=""/>
	<input type="hidden" id="hiredate" name="userVo.hiredate" value=""/>
	<input type="hidden" id="sal" name="userVo.sal" value=""/>
	<input type="hidden" id="comm" name="userVo.comm" value=""/>
	</form>
	
	<div id="testA" style="display:none">
	<h3>編輯修改欄位</h3>
	<table>
	<tr>
	<thead>
	<th>JOB</th>
	<th>HIREDATE</th>
	<th>SAL</th>
	<th>COMM</th>
	<th>DEPTNO</th>
	<th></th>
	<th></th>
	</thead>
	</tr>
	<tr>
	<tbody>
	<td><input type="text" name="" value="" id="job1"></td>
	<td id="checkUpdate"></td>
	<td><input type="text" name="" value="" id="sal1"></td>
	<td><input type="text" name="" value="" id="comm1"></td>
	<td><input type="text" name="" value="" id="deptno1"></td>
	<td><input type="button" class="btn-info" id="updateBtn" value="確認"/></td>
	<td><input type="button" class="btn-info" id="displayNoneBtn" value="取消"/></td>
	</tbody>
	</tr>
	</table>
	</div>
</body>
</html>