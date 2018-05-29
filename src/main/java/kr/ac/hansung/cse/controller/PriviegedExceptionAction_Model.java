package kr.ac.hansung.cse.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.security.PrivilegedExceptionAction;

public class PriviegedExceptionAction_Model implements PrivilegedExceptionAction<Object> {//절대경로 엑세스 거부 해결 클래스
	public String filePath;

	public PriviegedExceptionAction_Model(String filePath) {
		this.filePath = filePath;
	}

	public Object run() {
		try {
			return new FileInputStream(filePath);
		} catch (FileNotFoundException e) {
			//e.printStackTrace();
		}
		return null;
	}
}