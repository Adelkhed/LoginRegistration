package com.example.session.LoginUser.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
   
    private Long id;
    
    @NotBlank(message = "User Name is required.")
    @Size(min = 3, max = 30, message = "User Name must be between 3 and 30 characters.")
    private String userName;
    
    @NotBlank(message = "Email is required.")
    @Email(message = "Please enter a valid email.")
    private String email;
    
    @NotBlank(message = "Password is required.")
    @Size(min = 8, message = "Password must be at least 8 characters long.")
    private String password;
    
    @NotBlank(message = "Confirm Password is required.")
    @Transient
    private String confirmPassword;
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    // Constructors, Getters, and Setters
    public User() {}
    public User(Long id,
			@NotBlank(message = "User Name is required.") @Size(min = 3, max = 30, message = "User Name must be between 3 and 30 characters.") String userName,
			@NotBlank(message = "Email is required.") @Email(message = "Please enter a valid email.") String email,
			@NotBlank(message = "Password is required.") @Size(min = 8, message = "Password must be at least 8 characters long.") String password,
			@NotBlank(message = "Confirm Password is required.") String confirmPassword, Date createdAt,
			Date updatedAt) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}