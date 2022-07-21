<%@ page import="edu.booking.booking.entity.User" %>
<%@ page import="edu.booking.booking.user.session.UserSession" %>
<%@ page import="edu.booking.booking.entity.Privilege" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
</head>
<body>
<%
    User sessionUser = UserSession.USER.getFromSession(request);
    Privilege userSessionPrivilege = sessionUser.getPrivilegeId();
%>

<div style="padding: 20px">
        <%if(userSessionPrivilege.getId()==3){%>
    <%@include file="administrator.jsp" %>
        <%}else if(userSessionPrivilege.getId() == 2){%>
    <%@include file="manager.jsp" %>
        <%}else{%>
    <%@include file="client.jsp" %>
        <%}%>


<h1>Home page in progress...</h1>
</div>
</body>
</html>
