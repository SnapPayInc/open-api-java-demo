<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneOffset" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    String millisecends = String.valueOf(System.currentTimeMillis());
    millisecends = millisecends.substring(3);
    String orderId = millisecends + (int) (Math.random() * 899 + 100);
    LocalDateTime dateTime = LocalDateTime.now(ZoneOffset.UTC);
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String dateTimeStr = dateTime.format(formatter);
    String getRequestURI = request.getRequestURI();
    String serverPath = request.getServerName() + "/openapi/demojava/prod" + getRequestURI.substring(0, getRequestURI.lastIndexOf("/"));
%>

<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        ul, ol {
            list-style: none;
        }

        .new-btn-login-sp {
            border: 1px solid #D74C00;
            padding: 1px;
            display: inline-block;
        }

        .new-btn-login {
            background-color: #ff8c00;
            color: #FFFFFF;
            font-weight: bold;
            border: medium none;
            width: 82px;
            height: 28px;
        }

        .new-btn-login:hover {
            background-color: #ffa300;
            width: 82px;
            color: #FFFFFF;
            font-weight: bold;
            height: 28px;
        }

        .bank-list {
            overflow: hidden;
            margin-top: 5px;
        }

        .bank-list li {
            float: left;
            width: 153px;
            margin-bottom: 5px;
        }

        #main {
            width: 750px;
            margin: 0 auto;
            font-size: 14px;
            font-family: '宋体';
        }

        #pay_type option{
            width:187px;
        }

        .null-star {
            color: #fff;
        }

        .content {
            margin-top: 5px;
        }

        .content dt {
            width: 160px;
            display: inline-block;
            text-align: right;
            float: left;
        }

        .content dd {
            margin-left: 100px;
            margin-bottom: 5px;
        }

        #foot {
            margin-top: 10px;
        }

        .foot-ul li {
            text-align: center;
        }

        .cashier-nav {
            font-size: 14px;
            margin: 15px 0 10px;
            text-align: left;
            height: 30px;
            border-bottom: solid 2px #CFD2D7;
        }

        .cashier-nav ol li {
            float: left;
        }

        .cashier-nav li.current {
            color: #AB4400;
            font-weight: bold;
        }

        .cashier-nav li.last {
            clear: right;
        }

        .pay_link a:link {
            text-decoration: none;
            color: #8D8D8D;
        }

        .pay_link a:visited {
            text-decoration: none;
            color: #8D8D8D;
        }
    </style>
</head>