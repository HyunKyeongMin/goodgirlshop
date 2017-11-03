<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core 라이브러리를 사용하기 위한 선언문 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail.jsp</title>
<style type="text/css">
	body {
		margin: 0px;
		padding: 0px;
/* 		background-image: url("img/US4.png");
		background-size: 100% 100%;  */
	}
	#container {
		position: relative;
	}
	
	#contents {
		width: 1260px;
		margin: 5px auto 50px;
		min-height: 600px;
		border: 1px solid red;
	}
	
	.path-product {
		overflow: hidden;
	/* 	height: 30px;
		line-height: 30px; */
		border: 1px solid blue;
	}
	
	.path-product > h2 {
		overflow: hidden;
		position: absolute;
		width: 0;
		height: 0;
		white-space: nowrap;
		text-indent: 100%;
	}
	
	.path-product >ol {
		float: right;
		list-style:none;
	}
	
	li {
		float: left;
		font-size: 11px;
		padding: 0 0 0 11px;
		margin: 0 0 0 7px;
		color: #757575;
	}
	
	.path-product >a {
		font-size: 11px;
		color: #757575;
	}
	
	a {
		text-decoration: none;
		font-size: 12px;
	}
	
	.product-detail {
		position: relative;
		margin: 0 auto;
		padding: 37px 0 40px 0;
		border: 1px solid green;
	}
	
	.imgArea-wrap {
		float: left;
		width: 700px;
		margin-left: 10px;
		border: 1px solid skyblue;
	}
	
	.imageArea {
		margin: 0 auto;
	}
	
	.keyImg {
		max-width: 100%;
		margin: 0 auto;
		text-align: center;
		width: 380px;
		border: 1px solid skyblue;
	}
	
	#img_item {
		width: 400px;
		height: 400px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.infoArea-wrap {
		float: right;
		width: 450px;
		margin-right: 10px;
		border: 1px solid red;
	}
	
	.infoArea {
		border-top: 2px solid #575757;
	}
	
	.headingArea {
		position: relative;
		padding: 9px 0 8px;
		margin: 0;
		border-bottom: 1px solid #e7e7e7;
	}
	
	.icon {
		display: block;
		margin-left: 15px;
		font-size: 0;
		line-height: 0;
	}
	
	#img2 {
		margin: 5px 5px 2px 0;
		vertical-align: middle;	
		padding: 0;
	}
	
	h2 {
		padding: 4px 15px;
		font-size: 16px;
		font-weight: normal;
		line-height: 1.6;
		color: #2e2e2e;
	}
	
	.color {
		overflow: hidden;
		madding: 0 15px;
		display: none !important;
	}
	
	table {
		width: 100%;
		border-spacing: 0;
		border-collapse: collapse;
		border: 0;
	}
	
	caption {
		display: none;
	}
	
	tbody {
		display: table-row-group;
		vertical-align: middle;
		border-color: inherit;
	}
	
	tr {
		display: table-row;
		vertical-align: inherit;
		border-color: inherit;
	}
	
	th {
		border: 0;
		font-size: 11px !important;
		line-height: 1.6;
		font-weight: normal;
		width: 120px;
		padding: 8px 4px 8px 8px;
		text-align: left;
		vertical-align: midd;e
	}
	
	td {
		padding: 8px 10px 8px 0;
		line-height: 1.6;
		vertical-align: middle;
	}
	
	.product-option {
		border-bottom: 1px solid #e7e7e7;
	}
	
	.record {
		padding-bottom: 10px;
		padding-top: 10px;
		border-top: 1px solid #e7e7e7;
	}
	
	li >ul {
		display: table;
		width: 100%;
	}
	
	.title {
		display: table-cell;
		width: 120px;
		padding: 8px 4px 5px 8px;
		vertical-align: top;
		font-size: 11px !important;
		line-height: 1.6;
		font-weight: normal;
		text-align: left;
	}
	
	.angle-right {
		display: inline-block;
		font-size: 6px;
		color: #aaa;
		margin-right: 7px;
		text-rendering: auto;
		-webkit-font-smoothing: antialiased;
	}
	
	.content {
		display: table-cell;
		padding: 5px 10px 5px 0;
		vertical-align: middle;
	}
	
	li {
		list-style: none; 
	}
	
	input, select {
		width: 100%;
		height: 24px;
		font-size: 12px;
		color: #353535;
		border: 1px solid #e7e7e7;

	}
	
	.option {
		font-weight: normal;
		display: block;
		white-space: pre;
		min-height: 1.2em;
		padding: 0px 2px 1px;
	}
	
	.info {
		margin: 0;
		padding: 11px 0 0 4px;
	}
	
	#totalProducts {
		margin: 17px 0 0;
		border: 1px solid yellow;
	}
	
	.thead-wrap {
		border-top: 1px solid #9c9c9c;
	}
	
	.add {
		width: 100%;
		height: 20px;
	}
	
	colgroup {
		display: table-column-group;
	} 
	
	col {
		display: table-colum;
	}
	
	thead {
		display: table-header-group;
		vertical-align: middle;
		border-color: inherit;
	}
	
	tbody {
		font-size: 11px;
		vertical-align: middle;
		border-color: inherit;
	}
	
	.product {
		padding: 0 10px 0 0;
		font-weight: bold;
		line-height: 21px;
	}
	
	#span_p {
		display: inline-block;
		font-size: 11px;
		font-weight: normal;
		line-height: 1.5;
		padding: 4px 6px;
		margin: 4px 0 0;
		background: #afafaf;
		border-radius: 3px;
	}
	
	.quantity {
		width: 54px !important;
		display: inline-block;
		position: relative;
		vertical-align: top;
	}
	
	.quantity_id {
		float: left;
		height: 19px;
		line-height: 19px;
		width: 22px;
		padding: 0 2px 0 3px;
		border: 1px solid #d4d8d9;
		border-radius: 3px 0 0 3px;
	}
	
	.box_up {
		position: absolute;
		left: 28px;
		top: 0;
	}
	
	.box_down {
		position: absolute;
		left: 28px;
		top: auto;
		bottom: 0; 
	}
	
	.delete {
		position: relative;
		top: 5px;
		left: 0;
	}


</style>
</head>
<body>
	<div id="container">
		<div id="contents">
			<div class="path-product">
				<h2>현재 위치</h2>
				<ol>
					<li><a href="#">Home</a></li>
					<li><a href="#">상세페이지</a></li>
				</ol>
			</div>
			<div class="product-detail">
				<div class="detailArea">
					<div class="imgArea-wrap">
						<div class="imageArea">
							<div class="keyImg">
								<img id="img_item" alt="" src="img/c04.jpg">
							</div>
						</div>
					</div>
					<div class="infoArea-wrap">
						<div class="infoArea">
							<div class="headingArea">
								<span class="icon"> 
								<img id="img2" alt="" src="img/custom_1.gif"> 
								<img id="img2" alt="" src="img/custom_4.gif">
								</span>
								<h2>brunch-knit</h2>
								<div class="color"></div>
							</div>
							<table>
								<caption>기본 정보</caption>
								<tbody>
									<tr>
										<th scope="row"><span style="font-size: 13px;">판매가</span>
										</th>
										<td><span style="font-size: 13px;"> <strong
												id="price_text">44,000원</strong>
										</span></td>
									</tr>


									<tr>
										<th scope="row"><span style="font-size: 12px;">적립금</span>
										</th>
										<td><span style="font-size: 12px;">440원 (1%)</span></td>
									</tr>
								</tbody>
							</table>
							<ul border="1" class="product-option">
								<li class="record">
									<ul>
										<li class="title" scope="row"><i class="angle-right"
											aria-hidden="true"> </i> 칼라</li>
										<li class="content"><select>
												<option value="*">- [필수] 옵션 -</option>
												<option value="**">---------------</option>
												<option value="아이보리">아이보리</option>
												<option value="핑크">핑크</option>
												<option value="블루">블루</option>
												<option value="그레이">그레이</option>
										</select></li>
									</ul>
								</li>
							</ul>
							<div class="add"></div>
							<div id="totalProducts">
								<div class="thead-wrap"></div>
								<table border="1">
									<caption>상품 목록</caption>
									<colgroup>
										<col style="width:320px;">
										<col style="width:70px;">
										<col style="width:110px;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">상품명</th>
											<th scope="col">상품수</th>
											<th scope="col">가격</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="hidden" class="option_id" id="option_id" value="" name="item_cod[]">
												<p class="product">
												brunch-knit
												<br>
												-
												<span id="span_p">핑크</span>
												</p>
											</td>
												<span class="quantity" style= "width:65px;">
													<input type="text" id="quantity_id" name="quantity_opt[]" class="quantity_id">
													<a href="#">
														<img alt="수량증가" src="img/btn_count_up.gif" class="box_up">
													</a>
													<a href="#">
														<img alt="수량감소" src="img/btn_count_down.gif" class="box_down">
													</a>
												</span>
													<a href="#" class="delete">
														<img alt="삭제" src="img/btn_price_delete.gif" class="box_del">
													</a> 
										
										
										
										
										</tr>
									</tbody>
								
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>