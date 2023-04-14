<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        </head>

        <body>
            <h1>회원가입 페이지</h1>
            <hr>
            <form action="/join" method="post" onsubmit="return vaild()">
                <input id="username" type="text" name="username" placeholder="Enter username">
                <button type="button" onclick="sameCheck()">중복체크</button>
                <br>
                <input type="text" name="password" placeholder="Enter password"><br>
                <input type="text" name="email" placeholder="Enter email"><br>
                <button type="submit">회원가입</button>
            </form>

            <script>
                let submitCheck = false;

                function vaild() {
                    if (submitCheck) {
                        return true;
                    } else {
                        alert("username 중복체크 바람")
                        return false;
                    }
                }
                function sameCheck() {
                    let username = $("#username").val();
                    $.ajax(
                        {
                            type: "get",
                            url: "/user/usernameSameCheck?username=" + username
                        }
                    ).done((res) => {
                        submitCheck = res.data;
                        alert(res.msg);
                    }).fail((err) => { });
                }

            </script>
        </body>

        </html>