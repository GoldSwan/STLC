package kr.ac.hansung.cse.service;

import java.io.FileInputStream;
import java.security.AccessController;

import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.model.PriviegedExceptionAction_Model;

@Service
public class FileService {

	public byte[] getCertKey(String filePath) {

		byte[] baRequesterCert = null;
		try {
			PriviegedExceptionAction_Model prv_model = new PriviegedExceptionAction_Model(filePath);
			FileInputStream fis = (FileInputStream) AccessController.doPrivileged(prv_model);
			int size = fis.available();
			baRequesterCert = new byte[size];
			fis.read(baRequesterCert, 0, size);
			fis.close();
		} catch (Exception ex) {
			//ex.printStackTrace();
		}
		return baRequesterCert;
	}
	
}
