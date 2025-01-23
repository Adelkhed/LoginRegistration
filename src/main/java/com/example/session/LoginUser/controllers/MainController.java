package com.example.session.LoginUser.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.session.LoginUser.models.LoginUser;
import com.example.session.LoginUser.models.User;
import com.example.session.LoginUser.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

    @Autowired
    private UserService userServ;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
                           BindingResult result, Model model, HttpSession session) {
    	
        if (userServ.isValid(newUser, result)) {
            userServ.create(newUser);
            session.setAttribute("userId", newUser.getId());
            session.setAttribute("userName", newUser.getUserName());
            return "redirect:/home";
        }
        model.addAttribute("newUser",newUser);
        return "index.jsp";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser loginUser, 
                        BindingResult result, HttpSession session, Model model) {
        if (userServ.attemptLogin(loginUser, result)) {
            User user = userServ.findByEmail(loginUser.getEmail());
            session.setAttribute("userId", user.getId());
            session.setAttribute("userName", user.getUserName());
            return "redirect:/home";
        }
        return "index.jsp";
    }

    @GetMapping("/home")
    public String home(HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/";
        }
        return "home.jsp";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}