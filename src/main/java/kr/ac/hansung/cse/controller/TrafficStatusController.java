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

		byte[] baRequesterCert1 = fileService.getCertKey(ConstantTrafficInfoText.EAST_TEXT);
		byte[] baRequesterCert2 = fileService.getCertKey(ConstantTrafficInfoText.WEST_TEXT);
		byte[] baRequesterCert3 = fileService.getCertKey(ConstantTrafficInfoText.SOUTH_TEXT);
		byte[] baRequesterCert4 = fileService.getCertKey(ConstantTrafficInfoText.NORTH_TEXT);
		String text_url1 = new String(baRequesterCert1);/* byte->string 변환 */
		String text_url2 = new String(baRequesterCert2);/* byte->string 변환 */
		String text_url3 = new String(baRequesterCert3);/* byte->string 변환 */
		String text_url4 = new String(baRequesterCert4);/* byte->string 변환 */
		ArrayList<String> list1 = fileService.getTextInfoList(text_url1);
		ArrayList<String> list2 = fileService.getTextInfoList(text_url2);
		ArrayList<String> list3 = fileService.getTextInfoList(text_url3);
		ArrayList<String> list4 = fileService.getTextInfoList(text_url4);
		String textTime1 = new String(list1.get(1));// text에서 읽어들인 textTime 정보
		String textTime2 = new String(list2.get(1));
		String textTime3 = new String(list3.get(1));
		String textTime4 = new String(list4.get(1));

		// 신호등1
		if (map1.containsKey("url")) {
			if (map1.get("url").equals(ConstantTrafficInfoText.EAST_IMG0)&&!checkSameTime(map1, textTime1)) {
				map1.put("url", ConstantTrafficInfoText.EAST_IMG1);
				map1.put("trafficInfo", text_url1);
				map1.put("textime", textTime1);
			} else if(map1.get("url").equals(ConstantTrafficInfoText.EAST_IMG1) &&!checkSameTime(map1, textTime1)) {
				map1.put("url", ConstantTrafficInfoText.EAST_IMG0);
				map1.put("trafficInfo", text_url1);
				map1.put("textime", textTime1);
			}
		} else {
			map1.put("url", ConstantTrafficInfoText.EAST_IMG0);
			map1.put("trafficInfo", text_url1);
			map1.put("textime", textTime1);
		}

		// 신호등2
		if (map2.containsKey("url")) {
			if (map2.get("url").equals(ConstantTrafficInfoText.WEST_IMG0)&&!checkSameTime(map2, textTime2)) {
				map2.put("url", ConstantTrafficInfoText.WEST_IMG1);
				map2.put("trafficInfo", text_url2);
				map2.put("textime", textTime2);
			} else if(map2.get("url").equals(ConstantTrafficInfoText.WEST_IMG1) &&!checkSameTime(map2, textTime2)) {
				map2.put("url", ConstantTrafficInfoText.WEST_IMG0);
				map2.put("trafficInfo", text_url2);
				map2.put("textime", textTime2);
			}
		} else {
			map2.put("url", ConstantTrafficInfoText.WEST_IMG0);
			map2.put("trafficInfo", text_url2);
			map2.put("textime", textTime2);
		}

		// 신호등3
		if (map3.containsKey("url")) {
			if (map3.get("url").equals(ConstantTrafficInfoText.SOUTH_IMG0)&&!checkSameTime(map3, textTime3)) {
				map3.put("url", ConstantTrafficInfoText.SOUTH_IMG1);
				map3.put("trafficInfo", text_url3);
				map3.put("textime", textTime3);
			} else if(map3.get("url").equals(ConstantTrafficInfoText.SOUTH_IMG1) &&!checkSameTime(map3, textTime3)) {
				map3.put("url", ConstantTrafficInfoText.SOUTH_IMG0);
				map3.put("trafficInfo", text_url3);
				map3.put("textime", textTime3);
			}
		} else {
			map3.put("url", ConstantTrafficInfoText.SOUTH_IMG0);
			map3.put("trafficInfo", text_url3);
			map3.put("textime", textTime3);
		}

		// 신호등4
		if (map4.containsKey("url")) {
			if (map4.get("url").equals(ConstantTrafficInfoText.NORTH_IMG0)&&!checkSameTime(map4, textTime4)) {
				map4.put("url", ConstantTrafficInfoText.NORTH_IMG1);
				map4.put("trafficInfo", text_url4);
				map4.put("textime", textTime4);
			} else if(map4.get("url").equals(ConstantTrafficInfoText.NORTH_IMG1) &&!checkSameTime(map4, textTime4)) {
				map4.put("url", ConstantTrafficInfoText.NORTH_IMG0);
				map4.put("trafficInfo", text_url4);
				map4.put("textime", textTime4);
			}
		} else {
			map4.put("url", ConstantTrafficInfoText.NORTH_IMG0);
			map4.put("trafficInfo", text_url4);
			map4.put("textime", textTime4);
		}

		list.add(0, map1);
		list.add(1, map2);
		list.add(2, map3);
		list.add(3, map4);

		Map result = new HashMap();
		result.put("items", list);

		return result;
	}

	public boolean checkSameTime(Map map, String timeValue) {
		if (map.get("textime").equals(timeValue))
			return true;
		else
			return false;
	}
}
