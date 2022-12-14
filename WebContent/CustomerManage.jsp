<%@page import="java.util.ArrayList"%>
<%@page import="Model.CouponVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Lobster&family=Noto+Sans:ital,wght@1,700&family=Source+Sans+Pro:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/customerManage2.css">
<script src="https://kit.fontawesome.com/8c9374f376.js"
	crossorigin="anonymous"></script>
<title></title>
</head>
<body>
	<%
		List<CouponVO> clist = (List<CouponVO>) request.getAttribute("cusvo");

	ArrayList<String> id = new ArrayList<String>();

	for (CouponVO cusvo : clist) {
		if (!id.contains(cusvo.getId())) {
			id.add(cusvo.getId());
		}
	}

	int[] CouponSum = new int[id.size()];
	for (int i = 0; i < id.size(); i++) {
		for (int j = 0; j < clist.size(); j++) {
			if (id.get(i).equals(clist.get(j).getId())) {
		CouponSum[i] += clist.get(j).getStamp();
			}
		}

	}
	%>
	<!-- header part -->
	<div class="container">
		<div class="header">
			<div class="logo">
				<img id="img" src="./image/login/coffee.png">
				<p id="title">Cafe Wiki</p>
				<button class="btn" id="btn" type="button"
					onclick="location.href='logout.do'">๋ก๊ทธ์์</button>
			</div>
		</div>



		<!-- main part -->
		<div class="Main">
			<%
				for (int i = 0; i < id.size(); i++) {
			%>
			<form class="customer">
				<div class="tablewrap">
					<table class="table1">
						<tr>
							<td id="user" rowspan="2"><img src="./image/user.png">
							</td>
						</tr>
						<tr>
							<td id="accu">

								<p class="btn">
									ID :
									<%=id.get(i)%><br> ๋ณด์? ์คํฌํ ์ :
									<%=CouponSum[i]%></p>

							</td>
							<td id="plus" rowspan="2"><a id="hide<%=i%>"
								onclick="dis()"> <img src="./image/plus.png"></a></td>
						</tr>
					</table>
				</div>
				<span style="display: none;" id="dis<%=i%>">
					<table class="table2">

						<h3 class="btn">์ต๊ทผ ๋ด์ญ</h3>

						<tr class="btn">
							<th>์?๋ฆฝ/์ฌ์ฉ</th>
							<th>๊ฐ์</th>
							<th>๋?์ง</th>
						</tr>
						<%
							for (CouponVO cusvo : clist) {
							if ((id.get(i)).equals(cusvo.getId())) {
						%>
						<tr class="btn">
							<td>
								<%
									int a = cusvo.getStamp();
								if (a > 0) {
								%>์?๋ฆฝ <%
									} else if (a < 0) {
								%> ์ฌ์ฉ <%
									} else {
								%> ์ฟ?ํฐ์์ฑ <%
									}
								%>
							</td>
							<td>
								<%
									if (a < 0) {
								%> <%=-cusvo.getStamp()%> <%
 	} else {
 %> <%=cusvo.getStamp()%> <%
 	}
 %>
							
							<td><%=cusvo.getS_Date()%></td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</span>
			</form>
			<%
				}
			%>
		</div>
		<!-- footer & menu part -->
		<div class="footer">
			<div id="btn_group">
				<button class="btn" id="btn1" type="button"
					onclick="location.href='cafe.do'">๋ง์ดํ์ด์ง</button>

				<button class="btn" id="btn2" type="button"
					onclick="location.href='BarcodeScan.jsp'">์ฟ?ํฐ ๊ด๋ฆฌ</button>

				<button class="btn" id="btn3" type="button"
					onclick="location.href='customerManage.do'">๋ด ํ์ ๊ด๋ฆฌ</button>

				<button class="btn" id="btn4" type="button"
					onclick="location.href='Update.jsp'">์?๋ณด ์์?</button>
			</div>
		</div>
		<!-- footer & menu part -->

	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"> 
    <%for (int i = 0; i < id.size(); i++) {%>
    $(function (){
        $("#hide<%=i%>").click
        (function (){
          $("#dis<%=i%>").toggle();
			});
		})
	<%}%>
		
	</script>
</body>
</html>