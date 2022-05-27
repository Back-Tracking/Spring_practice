<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Register</title>

    <!-- Custom fonts for this template -->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/endor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body id="page-top">
	<!-- Header Start -->
	<jsp:include page="/WEB-INF/views/includes/header.jsp"></jsp:include>
	<!-- Header End -->
                
	<!-- Begin Page Content -->
	<div class="container-fluid">
	
	    <!-- Page Heading -->
	    <h1 class="h3 mb-2 text-gray-800">Board Register</h1>
	    <p class="mb-4">Register the articles</p>
	    
	    <!-- Register Contents -->
	    <div class="col-lg-12">
	    	<div class="panel panel-default">
	    		<!-- Panel Heading -->
	    		<div class="panel-heading">Board Register</div>
	    		
	    		<br/>
	    		
	    		<!-- Panel Body -->
	    		<div class="panel-body">
	    			<form role="form" action="/board/register" method="post">
	    				<!-- Title -->
	    				<div class="form-group">
	    					<label>Title</label> <input class="form-control" name="title">
	    				</div>         				
	    				
	    				<!-- Content -->
	    				<div class="form-group">
	    					<label>Content</label> 
	    					<textarea class="form-control" rows="3" name="content"></textarea>
	    				</div>
	    				
	    				<!-- Writer -->
	    				<div class="form-group">
	    					<label>Writer</label> 
	    					<input class="form-control" name="writer" value='<sec:authentication property="principal.username"/>' readonly/>
	    				</div>
	    				
	    				<button type="submit" class="btn btn-default">Submit</button>
	    				<button type="reset" class="btn btn-default">Reset</button>
	    				<button class="btn btn-default">
	    					<a href="/board/list">List</a>
	    				</button>
	    				
	    				<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
	    			</form>
	    		</div>
	    	</div>
	    </div>
	
	</div>
	<!-- /.container-fluid -->
           	
	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/views/includes/footer.jsp"></jsp:include>
	<!-- Footer End -->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>
</body>
</html>