<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	   $("#openHomePage").click(function(){
		  var url = "Home.action";
		  var win = window.open(url,"",'location=0,status=1,scrollbars=1,resizable=1');
		  win.focus();
	   });
	});
</script>
<body>
  <a href="#" id="openHomePage">請點選此連結至首頁</a>
</body>
</html>