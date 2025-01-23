package com.example.session.LoginUser.services;

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.session.LoginUser.models.LoginUser;
import com.example.session.LoginUser.models.User;
import com.example.session.LoginUser.repositories.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User create(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        return userRepository.save(user);
    }

    public boolean isValid(User user, BindingResult result) {
       

        
        if (userRepository.existsByEmail(user.getEmail())) {
            result.rejectValue("email", "Unique", "This email is already in use.");
            return false;
        }
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            result.rejectValue("confirmPassword", "Match", "Passwords must match.");
            return false;
        }
        return true;
    }

    public boolean attemptLogin(LoginUser loginUser, BindingResult result) {
        Optional<User> userInDb = userRepository.findByEmail(loginUser.getEmail());

        if (userInDb.isEmpty()) {
            result.rejectValue("email", "Invalid", "Invalid login.");
            return false;
        }

        User user = userInDb.get();
        if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Invalid", "Invalid login.");
            return false;
        }

        return true;
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }
}
