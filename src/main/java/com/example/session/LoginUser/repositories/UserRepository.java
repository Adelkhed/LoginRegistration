package com.example.session.LoginUser.repositories;


import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.session.LoginUser.models.User;

	@Repository
	public interface UserRepository extends CrudRepository<User, Long> {
		
	    public Optional<User> findByEmail(String email);
	    
	}
