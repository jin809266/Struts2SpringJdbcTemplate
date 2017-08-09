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
<link href="../../css/bootstrap.min.css" rel="stylesheet">
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
	$("#DeleteByEname").click(function(){
		var deptno = $("#deptno").html();
		$("#deptno").val(deptno);
		$("form").attr("action","Welcome!deleteByDeptno").submit();
	});
	
	$(".updateBtn").click(function(){
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
		$("#hiredate1").val(data.userVo.hiredate);
		$("#sal1").val(data.userVo.sal);
		$("#comm1").val(data.userVo.comm);
		$("#deptno1").val(data.userVo.deptno);
		},"json");
	});
});

</script>
</head>
<body>
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
	   	   <th></th>
	   	 </tr>
	   </thead>
	   <tbody>
	  		  <s:if test='actionMethodName.equals("queryByEname")'>
	       	  <tr>
		      <td width="13%" id="job"><s:property value="userVo.job" /></td>
		      <td width="16%" id="hiredate"><s:property value="userVo.hiredate" /></td>
		      <td width="14%" id="sal"><s:property value="userVo.sal" /></td>
		      <td width="12%" id="comm"><s:property value="userVo.comm" /></td>
		      <td width="10%" id="deptno"><s:property value="userVo.deptno" /></td>
		      <td width="15%"><input type="button" id="cleanByEname" value="清除"></td>
		      <td width="15%"><input type="button" id="DeleteByEname" value="刪除"></td>
		      </tr>
		      </s:if>
		      <s:elseif test='"queryByJob".equals(actionMethodName)'>
		      <s:iterator value="userList" status="s" var="r">
		      <tr>
		      <td width="13%" index='<s:property value="#s.index"/>' id='job_<s:property value="#s.index"/>'><s:property value="#r.job" /></td>
		      <td width="16%" index='<s:property value="#s.index"/>' id='hiredate_<s:property value="#s.index"/>'><s:property value="#r.hiredate" /></td>
		      <td width="14%" index='<s:property value="#s.index"/>' id='sal_<s:property value="#s.index"/>'><s:property value="#r.sal" /></td>
		      <td width="12%" index='<s:property value="#s.index"/>' id='comm_<s:property value="#s.index"/>'><s:property value="#r.comm" /></td>
		      <td width="10%" index='<s:property value="#s.index"/>' id='deptno_<s:property value="#s.index"/>'><s:property value="#r.deptno" /></td>
		      <td width="15%"><input type="button" index='<s:property value="#s.index"/>' class="updateBtn" value="編輯"></td>
		      <td width="15%"><input type="button" index='<s:property value="#s.index"/>' class="cleanBtn" value="清除"></td>
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
	<h3>編輯修改欄位如下</h3>
	<h5>JOB<input type="text" name="" value="" id="job1">
	<h5>HIREDATE<input type="text" name="" value="" id="hiredate1">
	<h5>SAL<input type="text" name="" value="" id="sal1">
	<h5>COMM</h5><input type="text" name="" value="" id="comm1">
	<h5>DEPTNO</h5><input type="text" name="" value="" id="deptno1">
	</div>
</body>
</html>