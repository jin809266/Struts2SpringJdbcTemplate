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
</style>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//     lowerCase to UpperCase Event
    $("#ename").keyup(function(){
    	if(event.keyCode >= 65 && event.keyCode <= 90){
    		$(this).val($(this).val().toUpperCase());
    	}
    });
    	
    $("#confrimBtn").click(function(e){
     e.preventDefault();
     var errMsg = '';
     if($.trim($("#ename").val()) === ''){
        errMsg += '請輸入查詢條件';
        alert(errMsg);
     }
     else{
    	 $("form").attr("action","Welcome!queryBtn").submit();
    	 }
    });
    
});
</script>
</head>
<body>
	<s:if test="hasActionErrors()">
		<div class="errors">
    		<s:actionerror cssClass="warning"/>
    	</div>
    </s:if>
	<div class="queryCss" style="margin:0 1% 0 1%">EMP管理頁面</div>
	<form action="" method="POST">
	<table width="98%" align="center" border="1">
	   <tr>
	     <th width="20%">員工查詢</th>
	     <td>ENAME：&nbsp;
<%-- 	  <s:textfield name="uservo.ename" id="ename"/> output 輸出結果 => <input type="text" name="uservo.ename" id="ename"/>--%>
	     <input type="text" name="uservo.ename" id="ename"/>&nbsp;<input type="button" value="查詢" id="confrimBtn"/>
	     </td>
	   </tr>
	   <tr>
	     <th>TESTA</th>
	   </tr>
	</table>
	</form>
	
	

</body>
</html>