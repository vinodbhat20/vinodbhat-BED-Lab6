<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<style>
.tablehead {
	background-color: blue;
	text-align: center;
}

.tablehead tr {
	color: white;
	text-align: center;
}

.title-container {
	background-color: pink;
	width: 100vw;
	height: 100px;
	text-align: center;
}

.title-container h3 {
	color: black;
	padding: 35px;
	text-align: center;
}
</style>

<title>Student List</title>
</head>

<body>
	<div class="title-container">
		<h3>STUDENT DETAILS</h3>
	</div>

	<hr>

	<div class="container">

		<table class="table table-borderless">

			<tbody>

				<td align="left"><a
					href="/StudentManagement/student/showFormAdd"
					class="btn btn-primary btn-sm mb-3"> Add Student </a></td>

				<td align="right"><a href="/StudentManagement/logout"
					class="btn btn-primary btn-sm mb-3 mx-auto"> Logout </a></td>
			</tbody>
		</table>

		<table class="table table-bordered table-striped">
			<thead class="tablehead">
				<tr>
					<th style="width: auto; text-align: center">Student Id</th>
					<th style="width: auto; text-align: center">FirstName</th>
					<th style="width: auto; text-align: center">LastName</th>
					<th style="width: auto; text-align: center">Course</th>
					<th style="width: auto; text-align: center">Country</th>
					<th style="width: auto; text-align: center">Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
						<td style="width: auto; text-align: center">
						<c:out
								value="${tempStudent.id}" /></td>
						<td style="width: auto; text-align: center">
						<c:out
								value="${tempStudent.firstName}" /></td>
						<td style="width: auto; text-align: center"><c:out
								value="${tempStudent.lastName}" /></td>
						<td style="width: auto; text-align: center"><c:out
								value="${tempStudent.course}" /></td>
						<td style="width: auto; text-align: center"><c:out
								value="${tempStudent.country}" /></td>
						<td style="width: auto; text-align: center">
							<!-- Add "update" button/link --> <a
							href="/StudentManagement/student/showFormUpdate?studentId=${tempStudent.id}"
							class="btn btn-info btn-sm"> Update </a> <!-- Add "delete" button/link -->
							<a
							href="/StudentManagement/student/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete ?'))) return false">
								Delete </a>
						</td>

					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>
</body>
</html>