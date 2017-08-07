<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style type="text/css">
.bgcolor{
	background-color: powderblue;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	// home click event
		$("#home").click(function(){
			alert("back home");
		});
	// user click event 
		$("#queryUser").click(function(){
			var url = "Welcome.action";
			 var win = window.open(url,"",'location=0,status=1,scrollbars=1,resizable=1');
			 win.focus();
		});
	// dept click event
		$("#queryDept").click(function(){
			alert("textB");
		});
});
	
</script>
<body>
<div class="container-fluid">
  <div class="row">
	<div>
		<table>
			<thead>
			  <tr>
				<th width="40%" class="bgcolor"><a href="#" id="home" title="ManagerSystem">ManagerSystem</a></th>
				  <th width="30%" class="bgcolor"><a href="#" id="queryUser" title="User">User</a></th>
				<th width="30%" class="bgcolor"><a href="#" id="queryDept" title="Dept">Dept</a></th>
			  </tr>
			</thead>
	   </table>
	 </div>
   </div>
 </div>
</body>
</html>