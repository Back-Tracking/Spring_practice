<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Modify</title>

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
        <h1 class="h3 mb-2 text-gray-800">Board Read</h1>
        <p class="mb-4">Read the articles</p>
        
        <!-- Register Contents -->
        <div class="col-lg-12">
        	<div class="panel panel-default">
        		<!-- Panel Heading -->
        		<div class="panel-heading">Board Read</div>
        		
        		<br/>
        		
        		<!-- Panel Body -->
        		<div class="panel-body">
        			<form role="form" action="/board/modify" method="post">
        				<!-- Title -->
        				<div class="form-group">
        					<label>Bno</label>
        					<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly>
        				</div>
        				
        				<div class="form-group">
        					<label>Title</label>
        					<input class="form-control" name="title" value='<c:out value="${board.title}"/>'>
        				</div>
        				
        				<!-- Content -->
        				<div class="form-group">
        					<label>Content</label> 
        					<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}" /></textarea>
        				</div>
        				
        				<!-- Writer -->
        				<div class="form-group">
        					<label>Writer</label> 
        					<input class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly></input>
        				</div>
        				
        				<button type="submit" data-oper="modify" class="btn btn-info">
        					Modify
        				</button>
        				<button type="submit" data-oper="remove" class="btn btn-danger">
        					Remove
        				</button>
        				<button type="submit" data-oper="list" class="btn btn-default">
        					List
        				</button>
        				
        				<!-- Paging Param -->
        				<input type="hidden" name="type"    value='<c:out value="${cri.type}"/>'/>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'/>
        				<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
        				<input type="hidden" name="amount"  value='<c:out value="${cri.amount}"/>'>
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

    <script type="text/javascript">
    	$(document).ready(function(){
    		var formObj = $("form");
    		
    		$('button').on("click", function(e) {
    			e.preventDefault();
    			
    			var operation = $(this).data("oper");
    			
    			console.log(operation);
    			
    			if (operation === "remove") {
    				// 遷移先：削除処理
    				formObj.attr("action", "/board/remove");
    			} else if (operation === "list") {
    				// 遷移先：一覧照会
    				formObj.attr("action", "/board/list").attr("method", "get");
    				
    				var typeTag    = $("input[name='type']").clone();
    				var keywordTag = $("input[name='keyword']").clone();
    				var pageNumTag = $("input[name='pageNum']").clone();
    				var amountTag  = $("input[name='amount']").clone();
    				
    				formObj.empty();
    				formObj.append(typeTag);
    				formObj.append(keywordTag);
    				formObj.append(pageNumTag);
    				formObj.append(amountTag);
    			}
    			formObj.submit();
    		})
    	});
    </script>

</body>
</html>