<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jspf/directive/page.jspf"%>
<%@ include file="/WEB-INF/jspf/directive/taglib.jspf"%>

<html>
<c:set var="title" value="TestInfo" />
<%@ include file="/WEB-INF/jspf/head.jspf"%>

<body>
	<%@ include file="/WEB-INF/jspf/header.jspf"%>

	<form id="test_info" action="controller">
		<input type="hidden" name="command" value="addQuestion" />

		<h3>
			<a href="controller?command=detailTest&testId=${test.id}">${test.name}</a>
		</h3>
		<table>
			<tr>
				<td>ID :</td>
				<td>${test.id}</td>
			</tr>
			<tr>
				<td>Category :</td>
				<td>${category.name}</td>
			</tr>
			<tr>
				<td>Level :</td>
				<td>${level.name}</td>
			</tr>
			<tr>
				<td>Questions:</td>
				<td>${test.questions.size()}</td>
			</tr>
			<tr>
				<td>Duration :</td>
				<td>${test.duration}</td>
			</tr>
		</table>

		<div>
			<p>
				<a href="controller?command=editTest&testId=${test.id}">Edit</a>
			</p>
			<p>
				<a href="controller?command=deleteTest&testId=${test.id}">Delete</a>
			</p>
		</div>

		<div>
			<h4>List Questions</h4>
		</div>
		<div id="add_question">
			<c:if test="${empty addQuestion}">
				<a
					href="controller?command=detailTest&testId=${test.id}&addQ=1&addA=4">Add
					Question</a>
			</c:if>

			<c:if test="${not empty addQuestion}">
				<%@ include file="/WEB-INF/jsp/admin/add_question.jsp"%>
			</c:if>
		</div>
		<h1></h1>
		<div>
			<table border='1'>
				<c:choose>
					<c:when test="${fn:length(test.questions) == 0}"> No such questions </c:when>

					<c:otherwise>
						<tr>
							<td>№</td>
							<td>Name</td>
							<td></td>
						</tr>
						<c:set var="i" value="0" />
						<c:forEach var="q" items="${test.questions}">
							<c:set var="i" value="${i+1}" />
							<tr>
								<td><h4>${i}</h4></td>
								<td><h4>${q.name}</h4></td>
								<td></td>
							</tr>
							<c:set var="j" value="0" />
							<c:forEach var="a" items="${q.answers}">
								<c:set var="j" value="${j+1}" />
								<tr>
									<td>${i}.${j}</td>
									<td>${a.name}</td>
									<td>${a.correct}</td>
								</tr>
							</c:forEach>
						</c:forEach>
						<tr></tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</form>
	<br />
	<div>
		<%@ include file="/WEB-INF/jspf/footer.jspf"%>
	</div>
</body>
</html>