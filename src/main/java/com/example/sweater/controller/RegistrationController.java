package com.example.sweater.controller;

import com.example.sweater.domain.User;
import com.example.sweater.domain.dto.CaptchaResponseDto;
import com.example.sweater.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL =
            "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    private String secret;

    @GetMapping("/registration")
    public String registration() {

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("g-recaptcha-response") String captchaResponce,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model
    ) {
        String url = String.format(CAPTCHA_URL, secret, captchaResponce);
        CaptchaResponseDto response =
                restTemplate.postForObject(url, Collections.EMPTY_LIST, CaptchaResponseDto.class);

        if (!response.isSuccess()) {
            model.addAttribute("captchaError", "Fill captcha");
        }

        if (user.getPassword() != null && !user.getPassword().equals(user.getPassword2())) {
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if (bindingResult.hasErrors() || !response.isSuccess()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }

        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }
}
