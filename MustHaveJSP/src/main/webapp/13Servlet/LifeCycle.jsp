<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LifeCycle.jsp</title>
</head>
<body>
	<script>
	/*
		JS에서 전송방식을 부여한 후 서버로 요청한다.
		submit() 함수가 호출되면 폼값이 전송된다.
		*/
	function requestAction(frm, met) {
		if (met == 1){
			frm.method = 'get';
		}
		else {
			frm.method = 'post';
		}
		frm.submit();
	}
	</script>
	<!-- 
		자바스크립터를 통해 폼값을 전송하므로 input 태그는 botton 타입으로 
		선언하고 onclick 이벤트 핸들러에서 함수를 호출한다.
	 -->
	<h2>서블릿 수명주기(Life Cycle) 메소드</h2>
	<form action="./LifeCycle.do">
	<!--  함수 호출시 form태그의 DOM을 인수로 전달한다. -->
		<input type="button" value="Get 방식 요청하기"
			onclick="requestAction(this.form, 1);" />
		<input type="button" value="Post 방식 요청하기"
			onclick="requestAction(this.form, 2);" />
	</form>
</body>
</html>