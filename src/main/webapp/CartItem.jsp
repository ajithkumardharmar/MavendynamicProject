<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CartItems</title>
</head>
<style>
.h2_1 {
	text-align: center;
	background-color: bisque;
}

.top_nav {
	/* background-color: brown;
        padding: 9px; */
	
}

.top_nav_in1 {
	position: relative;
	left: 500px;
	padding: 8px;
}

.top_nav_bu1 {
	position: relative;
	left: 520px;
	padding: 8px;
	background-color: cornflowerblue;
}

.top_nav_bu1 :hover {
	background-color: darkgreen;
	color: darkkhaki;
}

.table1 td {
	padding: 15px;
}

.button1 {
	text-decoration: none;
	position: relative;
	left: 60px;
	padding: 12px;
	padding-left: 32px;
	padding-right: 32px;
	color: blanchedalmond;
	border-radius: 12px;
	border-color: black;
	background-color: red;
}

.button1:hover {
	background-color: blue;
}

.mar1 {
	font-size: 30px;
	color: crimson;
}

.body_main {
	margin-top: 120px;
	margin-left: 240px;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: brown;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 12px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: goldenrod;
}

.active {
	background-color: grey;
}

.phoneInfo {
	margin-left: 250px;
	margin-top: -270px;
	font-size: 20px;
}
.but_log a{
	text-decoration:none;
	color:white;
 	padding: 12px;
 	margin-top:20px;
    margin-left: 100px;
    background-color: rgb(83, 83, 204);
    border-radius: 20px;

}
.but_log{
margin-top:40px;
}

* {
	margin: 0;
	padding: 0;
}
</style>
<body bgcolor="cornsilk">
	<h2 class="h2_1">Mobile Sales App</h2>

	<div class="top_nav">

		<ul>
			<li><a class="active" href="MobilePage.jsp">Home</a></li>
			<li><a href="ViewOrders.jsp">My Orders</a></li>
            <li><a href="ViewCart.jsp">Cart</a></li>
			<li><a href="ContactUs.jsp">Contact us</a></li>
			<li><a href="AboutUs.jsp">About us</a></li>
			<li style="float: right;"><a href="logOut">Logout</a></li>
			<li style="float: right;"><a href="AdminLogin.jsp">Admin</a></li>

		</ul>


	</div>
	
	<h1 style="color: green;margin-left: 500px;margin-top:200px">Your Item Added Carts</h1><img style="margin-left: 600px" width="100px" alt="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAA1VBMVEUWxgz///8TqAoTpgoVvQswrykmyh1VwE4JpgAVuQsAxAD6/vlAzzn7/vuq6KgSyQCj5qGe5Zs3zTCa5ZfG8MTC779Ezz/v++/k+OMTrwqF34GB3nwWxAy+77vS89F63XVz3G1o2mHt++yx667d9tzK8Miw661T004UtAvZ7tjM58ta11NQ1UmP4ou06rNozmRvxmuHzYOs26thwly237Sn26RFuz6R2Y2I3YVa0lbF6cJWylDA2L7p7emZy5Xc6dxStUxrvGYrrySp06d3wnSRz45ItETBgV4QAAAHl0lEQVR4nO3df1fTOhgH8GTDGlLGoCDd+LHNsikD9A4Br3q9XkXx/b+kG1q6tVnbpF2bJ4n9/uXxHDj5kDbJ0yUdwjnxD4+vPMeMeNfj80EvB4Iy/q/nj8Z9yoJMyVNj+1dngSsldAf7fYNwqzDkeOQLhe70nZm+MJS+XjNywsFu31heGErH016+0J29Ndv3FIreB3nCYBeZD2TE/sk0Wzg9tgLIQq9mWcLpxBYgIx4drgvnf0E3q84kiLFwsNiCblWtoUeztNC/GZ5CN6re0LejpLD3oXNhmRDR8SAhvHwg29Atqj303F0KB7ekY6GwP1oK77odC4WIToJn4XxIrBQiOouEvXsGtFN47YfCYGirMOxExGYKdhfaKnztMqH7kVgrRHTAhIMQaKtwjwnvrRZ6TPjRZiGiLupFQGuFIxR07Ra+Q4eW9+EV+ttuIfLQwnKhg15aLkSt0IK0QvPTCs1PKzQ/rdD8tELz0wrNj0nCcHNX6e1o5ggpujrzw10/V6WQpggpmqx2yfgTR55oiJB6+8mNTvjQkyaaIaTeG5zO6EiWaISQeueYj3QvmiCkzjoQ+wf2CKnzfh0of53qL8wBYvedJULqnGUCMT7vS/0C3YX5QPxKbqzRXFgAxCO5Hc16Cxkw7xwFE342X1jUgxjPro0XFgPxmSP1WzQW5k0TcXZNny1EQP+T4cKstWgqr+QuUm2FQmBwbPa6dL1c4uLumV09CXvQ3ZVbsiFNhZnlUjK9EifQdBSKRlE2UZQ4YqehUAzcK3OGUD8h3SlcybDslzokqZ2Q7hzWCtROKAYelDxjp5lQAljiYXAYvYQNAPUSNgHUSki9VwLgfoVzrhoJax9Fo+gjpEeiHiw10S+jjZAeCSb6MmvRZHQRCoFu1dc9aCJsDqiJkO4I7sGqlyjSREg90Si6wRtJdBAKe7DiKBpFA2FD82AceGHDQHhh/eUSF2hhI4vtVICFzQOBhQqAsMJmyiUukMKmR9EogMKmyiUucMLGyiUuYMIGq4l0oITKgFDCJsslLjDCRsslLiDCZsslLhBCNfNgHAChWiCAsPFyiYtyoYrFdiqqhcqBqoXqgYqFSsolLkqFikfRKCqFisolLgqFqsolLiWElFLHc5yqr6NXV02kIy2kdGdyfLC7d3A82alihAJKC6l3cvb8Yn7/7ET+bNzy59WVS1wkhfTzeeKLB/z30mfj4p9XWC5xkRPSySjdHsmTAMufV1kucZESLl+svIr8CUcENA/GkevDN+snV0Y70m0CBUoJ6UmQ0aqp7AJSdbnERaoPs/ckD+T+8ACL7VQkhPTz2l1YgggNlBJ+Wv/2FmkiOFBKeJDbOiERolzispkQD4o7AHYUjbKhEE+LJg2YcomL1H2Y9U1RcQqmfqByiYuMcDItauYobwEHVk2kIyP0iluac+JYE6Dcmuag6DJly/AsIly5xEVKeDQrbmwGEbBc4iJXW4yzFqaJrN2LkOUSF7naon+ct6yJiekRVYd5MI7sUwwhMTkv6gSUfoqBTopHm2QxBVwucZF/mjjOf39DmOUaFX6xnYq8kE4E7X4magYs9UT4tQxRN2Cpp/oyRA3KJS6lPrcQEx2dRtEo5T6ZoRPBcBOIgMom+mVKfvZEx4JJoziq1qLJlP507UQw9RdFUTWRTvnPD0WrG82A5YUUfRIsw/MCcYmiKn1YmQj0bcoVPuWuSFQ/ikap8jk+I5a/F5XPg3Eq7VSg5YcbMGDFvRjiYoqLynKJS+XdJqJiKg1Uu9hOpbJQWExpAtxgx5BwGa4HcJM9UbJE1eUSl012fckR4UbRKBvtaxMWUxhuol9ms517wmIKaC2azKZ7E4uLKZhqIp2Nd18WrW50AG4sLFqGa3CJohr6sICoBbCGPcK5RPBRNEoNu6BziinoeTBOHfu8M4spXYD17GTPKKYAyyUude3Vn6SJsIvtVOoS0uvE0+7puJa21ZPazltQ52201b03m3h1tKyu1HiihFLkeJ4T/kOj1HtmpvTXTSkI9Ptpmk8rND+t0Py0QvPTCs1PKzQ/rdD8tELz0wrNTys0P63Q/LRC89MKzc+fI7w4hW5JU/lzhMMt6JY0lVjYsVa4iIWWDjUOeoyFQztvRA99iYV2Xqb0HxR0OzZ3Ir1BvWUfWnknbn9F+OWKaN91ukX+Rfh+JbTuOj0dvsAIByuhbdP+6QX5xoTuS1uJpxcd8h8T4ruEkK1PodtVW56At70nYfCQIg4tGVK3hp0O+YqfhL0PKeGT0fwRh3UgA373QyEePHBE4+/H0Bd1YSjk7sQYebFlZleebg8jAfnhx8JgkUXsdLshdHt7y5RsXzBcvAwlnTmOhfhy/TpNUw1JstGE/OythPiuU0g0MeRXtLv+Weg/2kYk3+c4KcSDX3YRye9LnBbi+cIm4gq4EuL5D3uICWBCiAe23IuE3K6ASSH274onDUNCyM0cZwvZvHhLjDeSh7vUIay0EAc/h2YbCXmcp0mcEPfm38w1EkJ+XfJHzHghxm7w4QUxEMnaPLyZrx8tXxeyfnTnNw+kaw6TtZR0h4tLP+vtAFnCqCvn94vfL8zIx9vHL7knyv8HKDWzb+ES1KUAAAAASUVORK5CYII=">

</body>
</html>