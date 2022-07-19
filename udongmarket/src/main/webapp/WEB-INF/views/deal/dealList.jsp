<%@page import="co.nullception.udongmarket.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>거래 게시판 목록</title>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
	MemberVO mvo = new MemberVO();
%>
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
				<li class="active"><a href="dealList.do">장터</a></li>
				<li><a href="communityList.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>	
	<div><h1>거래 게시글 목록</h1></div>
	 <div>
		<form id="frm">
			<select id="key" name="key">
				<option value="deal_title">제목</option>
				<option value="deal_content">내용</option>
			</select>&nbsp;
			<input type="text" id="val" name="val">&nbsp;&nbsp;
			<input type="button" value="검색" onclick="dealSearch()">
		</form><br>
		
		<table border="1" width="80%">
			<thead>
				<tr>
					<th>NO</th>
					<th>상품이미지</th>
					<th>작성자</th>
					<th>제목</th>
					<th>가격</th>
					<th>작성일자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="d">
						<tr>
							<td>${d.boardId}</td>
							<td><img src="${d.attach}"></td>
							<td>${mvo.memberId}</td>
							<td><a href="dealDetail.do?boardId=${d.boardId}">${d.dealTitle}</a></td>
							<td>${d.price}</td>
							<td>${d.dealDate}</td>
							<td>${d.dealHit}</td>
						</tr>			
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" align="center">
						현재 거래중인 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>		
		</table><br>
		<div id = "page">
			<%
			int pageCount = (int) request.getAttribute("pageCount");
			int pageBlock = (int) request.getAttribute("pageBlock");
			int startPage = (int) request.getAttribute("startPage");
			int endPage = (int) request.getAttribute("endPage");

			for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="dealList.do?pageNum=<%=i%>"><%=i%></a>
			<%
			}
			%>
		</div><br>
		
		<div>
			<!-- 비회원은 글등록 못하게 -->
			<c:if test="${not empty id}">
				<button type="button" onclick="location.href='dealForm.do'">판매상품 등록하기</button>
			</c:if>
		</div>
	</div>
	
	<script type="text/javascript">
		function dealSearch() {
			let key = $("#key").val();
			let val = $("#val").val();
			$.ajax({
				url : "ajaxDealSearch.do",
				type : "post",
				data : {key : key, val : val},
				dataType : "json",
				success : function(result) {
					if(result.length > 0) {
						jsonHtmlConvert(result);
					} else {
						alert("검색한 결과가 없습니다.");
					}
				},
				error : function() {
					
				}
			})
		}
		
		function jsonHtmlConvert(data) {
			$('tbody').remove();
			var tbody = $("<tbody />");
			$.each(data, function(index, item) {
				var row = $("<tr />").append(
						  $("<td />").text(item.nickname),
						  $("<td />").text(item.dealTitle),
						  $("<td />").text(item.price),
						  $("<td />").text(item.dealDate),
						  $("<td />").text(item.dealHit)
				);
				tbody.append(row);
			});
			$('table').append(tbody);
		}
	</script>
</body>
</html>