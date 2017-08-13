<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<style type="text/css">
.errors {
background-color:#FFCCCC;
border:1px solid #CC0000;
width:400px;
margin-bottom:8px;
}
.queryCss{
background-color:#FFCCCC;
}
table, th, td{
border: 1px solid black;
}
</style>
<link href="<s:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//     lowerCase to UpperCase Event
    $("#ename").keyup(function(){
    	if(event.keyCode >= 65 && event.keyCode <= 90){
    		$(this).val($(this).val().toUpperCase());
    	}
    });
    $("#job").keyup(function(){
    	if(event.keyCode >= 65 && event.keyCode <= 90){
    		$(this).val($(this).val().toUpperCase());
    	}
    });
    	
    $("#queryEname").click(function(e){
     e.preventDefault();
     var errMsg = '';
     if($.trim($("#ename").val()) === ''){
        errMsg += '請輸入查詢條件';
        alert(errMsg);
     }
     else{
    	 $("form").attr("action","Welcome!queryByEname").submit();
    	 }
    });
    
    $("#queryJob").click(function(e){
        e.preventDefault();
        var errMsg = '';
        if($.trim($("#job").val()) === ''){
           errMsg += '請輸入查詢條件';
           alert(errMsg);
        }
        else{
       	 $("form").attr("action","Welcome!queryByJob").submit();
       	 }
     });
    
});
</script>
</head>
<body background="<s:url value="/image/blueGround.jpg"/>">
	<div class="queryCss" style="margin:0 1% 0 1%">EMP管理頁面</div><br/>
	<s:if test="hasActionErrors()">
		<div class="errors">
    		<s:actionerror cssClass="warning"/>
    	</div>
    </s:if>
	<form action="" method="POST">
	<table width="98%">
	   <tr>
	     <th width="20%">員工姓名</th>
	     <td>&nbsp;&nbsp;ENAME：&nbsp;
<%-- 	  <s:textfield name="uservo.ename" id="ename"/> output 輸出結果 => <input type="text" name="uservo.ename" id="ename"/>--%>
	     <input type="text" name="userVo.ename" id="ename"/>&nbsp;<input type="button" value="查詢" id="queryEname" class="btn-success"/>
	     </td>
	   </tr>
	   <tr>
	     <th width="20%">工作</th>
	     <td>&nbsp;&nbsp;JOB：&nbsp;
	     <input type="text" name="userVo.job" id="job"/>&nbsp;<input type="button" value="查詢" id="queryJob" class="btn-success"/>
	  	 </td>
	   </tr>
	</table>
	</form>
	
	

</body>
</html>