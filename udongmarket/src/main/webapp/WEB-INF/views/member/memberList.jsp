<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>전체 사용자 목록</title>

<script src="js/jquery-3.6.0.min.js"></script>
<style>
#membauthorCategory > ul  {
	list-style:none;
	padding: 0
}
li{
display: inline-block
}
</style>

<script src="js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.do">메인</a></li>
				<li><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	

	<div>
		<!-- 메인 > 관리자페이지 > 상세 카테고리 노출 -->
		<nav>
				<a href="memberList.do">사용자 목록</a>&nbsp;&nbsp;&nbsp;
				<a href="faq.do">FAQ</a>
		</nav>
		<br>
		<br> 

		<div align="center">

		<select id="membauthor">

		<!-- <div align="center">
		<select id="membauthorCategory" name="membauthorCategory"
		 onchange="authorselectList()">

		<select id="membauthorCategory" name="membauthorCategory"
		 onchange="authorselectList()">

		<option value="membauthorselect">== 권 한 ==</option>
		<option value="ADMIN">ADMIN</option>
		<option value="USER">USER</option>
		<option value="BLIND">BLIND</option>
		</select>
		</div> -->
		<!-- 권한에 따른 필터기능 -->
		<div id="membauthorCategory" onchange="authorselectList()">
		<ul>
		<!-- <li>
		    <label for="ALL" style="cursor:pointer">
		    <input type="radio" id="ALL" onclick="" />전체 </label>
		</li> -->
		<li>
		    <label for="ADMIN" style="cursor:pointer">
		    <input type="radio" id="ADMIN" name="author" value="ADMIN" />ADMIN </label>
		</li>
		<li>
		    <label for="USER" style="cursor:pointer">
		    <input type="radio" id="USER" name="author" value="USER" />USER</label>
		</li>
		<li>
		    <label for="BLIND" style="cursor:pointer">
		    <input type="radio" id="BLIND" name="author" value="BLIND" />BLIND
		    </label>
		</li>
		</ul>
		</div><br>
		<table border=1 id='tble'>
			<thead>
				<tr>
					<th>권한</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>매너온도</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="m">
					<tr>
						<td>${m.author}</td>
						<td>${m.memberId}</td>
						<td>${m.nickname}</td>
						<td>${m.email}</td>
						<td>${m.mannerTemp}</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
	</div>

<script type="text/javascript">
	function authorselectList(){
		//select 태그의 값이 변경될 때 멤버 리스트 필터하는 함수 #membauthorCategory
		let category = $("input[name='author']:checked").val();

<script type="text/javascript">
	function authorselectList(){
		//select 태그의 값이 변경될 때 멤버 리스트 필터하는 함수
		let category = $("#membauthorCategory option:selected").text();
		

		$.ajax({
			url : "ajaxMemberList.do",
			type : "post",
			data : {category : category},
			dataType : "Json",
			success : function(result){

				console.log(result.length);
				
				/* if(result != null){
					jsonMembListConvert(result);
				} */
				result.length != 0 ? jsonMembListConvert(result) : jsonMembListNull();

				console.log(result);
				/* if(result != null){
					jsonComListConvert(result);
				} else {
				
				}*/

			}, 
			error: function(){
				console.log("error");
			}
		})
	}

	function jsonMembListConvert(data){
 		$("#tble tbody").remove();
		let tbody = $("<tbody />");
		$.each(data, function(index, item){
			let row = $("<tr />").append(
   					  $("<td />").text(item.author),
					  $("<td />").text(item.memberId),
					  $("<td />").text(item.nickname),
					  $("<td />").text(item.email),
					  $("<td />").text(item.mannerTemp)
					);
			tbody.append(row);
		});
		$('#tble').append(tbody);
 	}
	
	function jsonMembListNull(){
		$("#tble tbody").remove();
		let tbody = $("<tbody />");
			let row = $("<tr />").append(
   					  $("<td colspan='5' />").text("결과값이 없습니다")
   					  
					);
			tbody.append(row);
		$('#tble').append(tbody);
	}
	
	
</script>


</body>
</html>