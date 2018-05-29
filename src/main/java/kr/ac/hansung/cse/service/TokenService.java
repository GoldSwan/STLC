package kr.ac.hansung.cse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.dao.TokenDao;
import kr.ac.hansung.cse.model.Token;

@Service
public class TokenService {

	@Autowired
	private TokenDao tokenDao;

	public List<String> getTokenValues() {
		return tokenDao.getTokenValues();
	}

	public void insertToken(Token token) {
		tokenDao.insertToken(token);
	}

}
