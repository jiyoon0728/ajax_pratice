package shop.mtcoding.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.ajax.dto.ResponseDto;

@Controller
public class UserController {

    @GetMapping("/joinForm")
    public String joinForm() {
        return "joinForm";
    }

    @GetMapping("/user/usernameSameCheck")
    public @ResponseBody ResponseDto<?> check(String username) {

        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "username 전달 바람", null);
        }

        if (username.equals("ssar")) {
            return new ResponseDto<>(1, "동일한 username 존재", false);
        } else {
            return new ResponseDto<>(1, "username 사용 가능", true);
        }

    }
}