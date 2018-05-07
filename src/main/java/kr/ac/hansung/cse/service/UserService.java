package kr.ac.hansung.cse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.UserDao;
import kr.ac.hansung.cse.model.User;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public List<String> getUsers() {

		List<User> users = userDao.getUsers();
		List<String> tokens = new ArrayList<>();
		for (User user : users) {
			tokens.add(user.getToken());
		}

		return tokens;
	}

	public void insert(User user) {
		userDao.insert(user);
	}
}
