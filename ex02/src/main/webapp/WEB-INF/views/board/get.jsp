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
                           	<div class="form-group">
                           		<label>Bno</label>
                           		<input class ="form-control" name="bno"
                           		 value='<c:out value="${board.bno }"/>' readonly ="readonly">
                           	</div>
                           	<div class="form-group">
                           		<label>Title</label>
                           		<input class ="form-control" name="title"
                           		 value='<c:out value="${board.title }"/>' readonly ="readonly">
                           	</div>
                           	<div class="form-group">
                           		<label>Text area</label>
                           		<textarea class ="form-control" name='content' rows="3"
                           		  readonly ="readonly"><c:out value="${board.content}"/>
                           		 </textarea>
                           	</div>
                           	<div class="form-group">
                           		<label>Writer</label>
                           		<input class ="form-control" name="writer"
                           		 value='<c:out value="${board.writer}"/>' readonly ="readonly">
                           	</div>
                           	<button data-oper='modify' class="btn btn-success">
                           		<a style="color:white;" href="#"/>Modify</a></button>
                          
                           	<button data-oper='list' class="btn btn-info">
                           		<a style="color:white;" href="#">List</a></button>
                           	
                           	<form id='operForm' action="/board/modify" method="get">
                           		<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
                           		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                           		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                           		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
                           		<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
                           	</form>
						</div>  
                    </div>
                    <div class="card shadow mb-4">
                    	 <div class="card-header py-2">
                            <h6 class="m-2 font-weight-bold text-primary float-left">
                            	<i class="fa fa-comments fa-fw"></i>
                            Reply</h6>
                            <button id='addReplyBtn' class="m-1 btn-sm btn-primary float-right" style="border:None;">
                            	New Reply
                            </button>
                        </div>
                        <div class="card-body">
                        	<ul class="chat">
                        		<li class="left clearfix" data-rno='12'>
                        			<div class="header">
                        				<Strong class="primary-font">user00</Strong>
                        				<small class="float-right text-muted">2021-03-27 17:00</small>
                        			</div>
                        			<p>Good job!</p>
                        		</li>
                        	</ul>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                
<script type="text/javascript" src="/resources/js/reply.js">
</script>                
<script type="text/javascript">
$(document).ready(function(){
	
	console.log(replyService);
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
		showList(1);
	
	function showList(page){
		replyService.getList(
		{bno:bnoValue, page:page||1}
		,
		function(list){
			var str ="";
			if(list == null||list.length==0){
				replyUL.html("");
				return;
			}
			for(var i =0, len=list.length||0; i<len; i++){
				str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str+="<div><div class='header'><string class='primary-font'>"+list[i].replyer+"</string>";
				str+="<small class='float-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small><div>";
				str+="<p>"+list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			
	}); 
	}
	
	/*  replyService.add(
		{reply:"JS Test", replyer:"tester",bno:bnoValue}
		,
		function(result){
			alert("RESULT: "+result);
	});  */
	
	
	
	 /* replyService.remove(47,function(count){
		console.log(count);
		
		if(count=="success"){
			alert("REMOVE");
		}
	}, function(err){
		alert('ERROR....');
	}); */
	
	
	/* replyService.update(
			{rno:"50", bno:bnoValue,reply:"Modified Reply"}
			,
			function(result){
				alert("수정 완료");
		}, function(err){
			alert('ERROR.....')
		});  */
		
	/* replyService.get(10,function(data){
		console.log(data);
	}) */
	
	
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click",function(e){
		operForm.attr("action","/board/modify").submit();
	})
	
	$("button[data-oper='list']").on("click",function(e){
		operForm.find('#bno').remove();
		operForm.attr("action","/board/list");
		operForm.submit();
	});
});
</script>
<%@include file ="/WEB-INF/views/includes/footer.jsp"%>
