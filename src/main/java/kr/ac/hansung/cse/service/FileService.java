package kr.ac.hansung.cse.service;

import java.io.FileInputStream;
import java.security.AccessController;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.stereotype.Service;

import kr.ac.hansung.cse.model.PriviegedExceptionAction_Model;

@Service
public class FileService {

	private List list = new ArrayList<String>();
	
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
			ex.printStackTrace();
		}
		return baRequesterCert;
	}
	
	public ArrayList getTextInfoList(String textInfo){
		
		StringTokenizer st = new StringTokenizer(textInfo," ");
		ArrayList<String> list = new ArrayList<>();
		String textInfoblock = "";
		int i=0;
		
		while(st.hasMoreTokens()) {//i=0:남은 시간 정보 i=1 텍스트 생성 시간
			textInfoblock = st.nextToken();
			list.add(i,textInfoblock);
			i++;
		}
		return list;
	}
}
