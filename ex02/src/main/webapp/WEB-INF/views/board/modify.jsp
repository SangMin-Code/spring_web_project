<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 

<%@include file ="/WEB-INF/views/includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Board Read</h1>
                    <p class="mb-4"></p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Board Read Page</h6>
                        </div>
                        <div class="card-body">
                        	<form role ="form" action="/board/modify" method="post">
                        	<!-- hidden  -->
                        	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>                        
                        	<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>   
                        	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
                           	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                        	                     
                           	<div class="form-group">
                           		<label>Bno</label>
                           		<input class ="form-control" name="bno"
                           		 value='<c:out value="${board.bno }"/>' readonly ="readonly">
                           	</div>
                           	<div class="form-group">
                           		<label>Title</label>
                           		<input class ="form-control" name="title"
                           		 value='<c:out value="${board.title }"/>'>
                           	</div>
                           	<div class="form-group">
                           		<label>Text area</label>
                           		<textarea class ="form-control" name='content' rows="3">
                           		<c:out value="${board.content}"/>
                           		</textarea>
                           	</div>
                           	<div class="form-group">
                           		<label>Writer</label>
                           		<input class ="form-control" name="writer"
                           		 value='<c:out value="${board.writer}"/>'>
                           	</div>
                           	<div class="form-group">
                           		<label>RegDate</label>
                           		<input class ="form-control" name="regDate"
                           		 value='<fmt:formatDate pattern ="yyyy/MM/dd" value="${board.regdate }"/>' readonly=readonly>
                           	</div>
                           	<div class="form-group">
                           		<label>Update Date</label>
                           		<input class ="form-control" name="updateDate"
                           		 value='<fmt:formatDate pattern ="yyyy/MM/dd" value="${board.updateDate}"/>' readonly=readonly>
                           	</div>
                           	<button type ="submit" data-oper='modify' class="btn btn-success">
                           		Modify</button>
                           	<button type="submit" data-oper='remove' class="btn btn-danger">
                           		Remove</button>
                           	<button type="submit" data-oper='list' class="btn btn-info">
                           		List</button>
                           		
                           	</form>
						</div>                            
                    </div>
                </div>
                <!-- /.container-fluid -->
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form");
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation ==='remove'){
			formObj.attr("action","/board/remove");
		}
		else if(operation==='list'){
			formObj.attr("action","/board/list").attr("method","get");
			var pageNumTag=$("input[name='pageNum']").clone();
			var amountTag=$("input[name='amount']").clone();
			var keywordTag=$("input[name='keyword']").clone();
			var typeTag=$("input[name='type']").clone();
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}
		formObj.submit();
	});
});
</script>                
                
<%@include file ="/WEB-INF/views/includes/footer.jsp"%>
