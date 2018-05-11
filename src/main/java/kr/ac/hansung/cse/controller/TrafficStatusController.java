package kr.ac.hansung.cse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.hansung.cse.service.FileService;

@Controller
public class TrafficStatusController {

	@Autowired
	private FileService fileService;

	private List list = new ArrayList();
	private Map map1 = new HashMap();// traffic1
	private Map map2 = new HashMap();// traffic2
	private Map map3 = new HashMap();// traffic3
	private Map map4 = new HashMap();// traffic4
	
	@RequestMapping(value = "/trafficstatus")
	public String traffic1() {
		return "trafficstatus";
	}

	@RequestMapping(value = "/ajaxtrafficstatus.do")
	public @ResponseBody Map getBoardList1(Locale locale, Model model, HttpServletRequest request) throws IOException {
		/* TEST DATA 생성 */
		/* byte로 text 읽기 */

		byte[] baRequesterCert1 = fileService.getCertKey(ConstantTrafficInfoText.TRAFFIC_INFO_TEXT1_URL);
		byte[] baRequesterCert2 = fileService.getCertKey(ConstantTrafficInfoText.TRAFFIC_INFO_TEXT2_URL);
		byte[] baRequesterCert3 = fileService.getCertKey(ConstantTrafficInfoText.TRAFFIC_INFO_TEXT3_URL);
		byte[] baRequesterCert4 = fileService.getCertKey(ConstantTrafficInfoText.TRAFFIC_INFO_TEXT4_URL);
		String text_url1 = new String(baRequesterCert1);/* byte->string 변환 */
		String text_url2 = new String(baRequesterCert2);/* byte->string 변환 */
		String text_url3 = new String(baRequesterCert3);/* byte->string 변환 */
		String text_url4 = new String(baRequesterCert4);/* byte->string 변환 */
		
		//신호등1
		if (map1.containsKey("url")) {
			if (map1.get("url").equals("/STLC/resources/files/traffic1_1.jpg")) {
				map1.put("url", "/STLC/resources/files/traffic1_2.jpg");
				map1.put("trafficInfo", text_url1);
			} else {
				map1.put("url", "/STLC/resources/files/traffic1_1.jpg");
				map1.put("trafficInfo", text_url1);
			}
		} else {
			map1.put("url", "/STLC/resources/files/traffic1_1.jpg");
			map1.put("trafficInfo", text_url1);
		}
		
		//신호등2
		if (map2.containsKey("url")) {
			if (map2.get("url").equals("/STLC/resources/files/traffic2_1.jpg")) {
				map2.put("url", "/STLC/resources/files/traffic2_2.jpg");
				map2.put("trafficInfo", text_url2);
			} else {
				map2.put("url", "/STLC/resources/files/traffic2_1.jpg");
				map2.put("trafficInfo", text_url2);
			}
		} else {
			map2.put("url", "/STLC/resources/files/traffic2_1.jpg");
			map2.put("trafficInfo", text_url2);
		}
		
		//신호등3
		if (map3.containsKey("url")) {
			if (map3.get("url").equals("/STLC/resources/files/traffic3_1.jpg")) {
				map3.put("url", "/STLC/resources/files/traffic3_2.jpg");
				map3.put("trafficInfo", text_url3);
			} else {
				map3.put("url", "/STLC/resources/files/traffic3_1.jpg");
				map3.put("trafficInfo", text_url3);
			}
		} else {
			map3.put("url", "/STLC/resources/files/traffic3_1.jpg");
			map3.put("trafficInfo", text_url3);
		}
		
		//신호등4
		if (map4.containsKey("url")) {
			if (map4.get("url").equals("/STLC/resources/files/traffic4_1.jpg")) {
				map4.put("url", "/STLC/resources/files/traffic4_2.jpg");
				map4.put("trafficInfo", text_url4);
			} else {
				map4.put("url", "/STLC/resources/files/traffic4_1.jpg");
				map4.put("trafficInfo", text_url4);
			}
		} else {
			map4.put("url", "/STLC/resources/files/traffic4_1.jpg");
			map4.put("trafficInfo", text_url4);
		}

		list.add(0, map1);
		list.add(1, map2);
		list.add(2, map3);
		list.add(3, map4);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}

}
