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

	@RequestMapping(value = "/traffic1")
	public String traffic1() {
		return "traffic1";
	}
	@RequestMapping(value = "/traffic2")
	public String traffic2() {
		return "traffic2";
	}
	@RequestMapping(value = "/traffic3")
	public String traffic3() {
		return "traffic3";
	}
	@RequestMapping(value = "/traffic4")
	public String traffic4() {
		return "traffic4";
	}

	@RequestMapping(value = "/ajax1.do")
	public @ResponseBody Map getBoardList1(Locale locale, Model model, HttpServletRequest request) throws IOException {
		/* TEST DATA 생성 */
		/* byte로 text 읽기 */
		byte[] baRequesterCert = fileService.getCertKey(ConstantTrafficInfoText.URL);
		String str = new String(baRequesterCert);/* byte->string 변환 */

		if (map1.containsKey("url")) {
			if (map1.get("url").equals("/STLC/resources/files/traffic1_1.jpg")) {
				map1.put("url", "/STLC/resources/files/traffic1_2.jpg");
				map1.put("trafficInfo", str);
			} else {
				map1.put("url", "/STLC/resources/files/traffic1_1.jpg");
				map1.put("trafficInfo", str);
			}
		} else {
			map1.put("url", "/STLC/resources/files/traffic1_1.jpg");
			map1.put("trafficInfo", str);
		}

		list.add(0, map1);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}
	
	@RequestMapping(value = "/ajax2.do")
	public @ResponseBody Map getBoardList2(Locale locale, Model model, HttpServletRequest request) throws IOException {
		/* TEST DATA 생성 */
		/* byte로 text 읽기 */
		byte[] baRequesterCert = fileService.getCertKey(
				"C:\\Users\\Swan\\Desktop\\Javaworkspace\\KKCC-master\\KKCC-master\\src\\main\\webapp\\resources\\files\\trafficinfo2.txt");
		String str = new String(baRequesterCert);/* byte->string 변환 */

		if (map2.containsKey("url")) {
			if (map2.get("url").equals("/STLC/resources/files/traffic2_1.jpg")) {
				map2.put("url", "/STLC/resources/files/traffic2_2.jpg");
				map2.put("trafficInfo", str);
			} else {
				map2.put("url", "/STLC/resources/files/traffic2_1.jpg");
				map2.put("trafficInfo", str);
			}
		} else {
			map2.put("url", "/STLC/resources/files/traffic2_1.jpg");
			map2.put("trafficInfo", str);
		}

		list.add(0, map2);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}
	
	@RequestMapping(value = "/ajax3.do")
	public @ResponseBody Map getBoardList3(Locale locale, Model model, HttpServletRequest request) throws IOException {
		/* TEST DATA 생성 */
		/* byte로 text 읽기 */
		byte[] baRequesterCert = fileService.getCertKey(
				"C:\\Users\\Swan\\Desktop\\Javaworkspace\\KKCC-master\\KKCC-master\\src\\main\\webapp\\resources\\files\\trafficinfo3.txt");
		String str = new String(baRequesterCert);/* byte->string 변환 */

		if (map3.containsKey("url")) {
			if (map3.get("url").equals("/STLC/resources/files/traffic3_1.jpg")) {
				map3.put("url", "/STLC/resources/files/traffic3_2.jpg");
				map3.put("trafficInfo", str);
			} else {
				map3.put("url", "/STLC/resources/files/traffic3_1.jpg");
				map3.put("trafficInfo", str);
			}
		} else {
			map3.put("url", "/STLC/resources/files/traffic3_1.jpg");
			map3.put("trafficInfo", str);
		}

		list.add(0, map3);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}
	
	@RequestMapping(value = "/ajax4.do")
	public @ResponseBody Map getBoardList4(Locale locale, Model model, HttpServletRequest request) throws IOException {
		/* TEST DATA 생성 */
		/* byte로 text 읽기 */
		byte[] baRequesterCert = fileService.getCertKey(
				"C:\\Users\\Swan\\Desktop\\Javaworkspace\\KKCC-master\\KKCC-master\\src\\main\\webapp\\resources\\files\\trafficinfo4.txt");
		String str = new String(baRequesterCert);/* byte->string 변환 */

		if (map4.containsKey("url")) {
			if (map4.get("url").equals("/STLC/resources/files/traffic4_1.jpg")) {
				map4.put("url", "/STLC/resources/files/traffic4_2.jpg");
				map4.put("trafficInfo", str);
			} else {
				map4.put("url", "/STLC/resources/files/traffic4_1.jpg");
				map4.put("trafficInfo", str);
			}
		} else {
			map4.put("url", "/STLC/resources/files/traffic4_1.jpg");
			map4.put("trafficInfo", str);
		}
		
		list.add(0, map4);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}
}
