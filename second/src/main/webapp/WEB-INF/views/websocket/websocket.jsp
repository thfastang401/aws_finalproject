<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#chatarea {background-color : yellow; border:2px solid black}
</style>
</head>
<body>
별명: <input type="text" id="nickname" value="${param.id}">
<input type="button" id="enterbtn" value="입장">
<h1>채팅영역</h1>
<div id="chatarea">채팅내용표시<br></div>
전송할 메세지: <input type=text id=message>
<input type=button id=sendbtn value="메세지전송">


<script src="js/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	var websocket;
	$("#enterbtn").on('click',function(){
		websocket = new WebSocket("ws://localhost:8085/ws");/* 웹소켓할때는 http말고 ws로 */
		websocket.opopen = open;/* open함수 하나 만들어주기(아래에 만듦!) */
		websocket.onclose = close;
		websocket.onmessage = message;//서버가 응답한 내용을 받아오는 중
	});
	$("#sendbtn").on('click',function(){
		var nickname = $("#nickname").val();
		var sendmessage = $("#message").val();
		websocket.send(nickname + ":" + sendmessage);
	}); //서버로 송신
	
});

function open(){console.log("웹소켓 연결 성공");}
function close(){console.log("웹소켓 해제	성공");}
function message(evt){
	console.log("서버로부터 메세지 수신 성공");
	$("#chatarea").append(evt.data+"<br>");
}
</script>

</body>
</html>