package kr.ac.hansung.cse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.hansung.cse.service.FileService;
import kr.ac.hansung.cse.service.SectionService;

@Controller
public class TrafficStatusController {
	private static final String TEXT_DIR = "/var/lib/tomcat8/webapps/STLC/resources/files";
	private static final String FILE_DIR = "/STLC/resources/files";
	private static final String[] EWSN = { "/east", "/west", "/south", "/north" }; 
	private static final String IMAGE_DIR = "/STLC/resources/images";
	private static final String[] LIGHT = { "/light-green", "/light-left", "/light-yellow", "/light-red" };

	@Autowired
	private FileService fileService;
	
	@Autowired
	private MessageController messageController;
	
	@Autowired
	private SectionService sectionService;
	
	private Map<String, String> texttimes = new HashMap<>();
	
	@RequestMapping(value = "/trafficstatus/{id}")
	public String traffic(Model model, @PathVariable("id") int id) {
		model.addAttribute("id", id);
		return "trafficstatus";
	}

	@RequestMapping(value = "/ajaxtrafficstatus.do/{id}")
	public @ResponseBody Map<String, List<Map<String, String>>> getBoardList(
			Locale locale, Model model, HttpServletRequest request, @PathVariable("id") int id) {
		Map<String, List<Map<String, String>>> result = new HashMap<>();
		List<Map<String, String>> list = new ArrayList<>(4);
		
		// 사고상황 인지
		byte[] stream = fileService.getCertKey(TEXT_DIR + "/" + id + "/global.txt");
		if (stream != null) {
			String[] textDatas = new String(stream).split(" ");
			if (textDatas[0].equals("1"))
				messageController.sendMessage(new String(sectionService.getSectionById(id).getName() + " 사고 발생"));

			/* map에 저장 */
			Map<String, String> map = new HashMap<>();
			map.put("remaintime", textDatas[1]);
			map.put("totaltime", textDatas[2]);
			list.add(map);
		}
		
		for (int i = 0; i < 4; i++) {
			/* text 파일 */
			byte[] baRequesterCert = fileService.getCertKey(TEXT_DIR + "/" + id + EWSN[i] + ".txt");
			if (baRequesterCert == null)
				continue;

			// 실시간 이미지
			String text = new String(baRequesterCert); //byte->string 변환
			String[] textDatas = text.split(" ");
			String imgPath;
			if (!texttimes.containsKey(Integer.toString(i))) {
				imgPath = FILE_DIR + "/" + id + EWSN[i] + textDatas[0] + "_result.jpg"; //이미지 경로 찾기
				texttimes.put(Integer.toString(i), textDatas[0]);
			} else {
				if(!(texttimes.get(Integer.toString(i)).equals(textDatas[0])))
					imgPath = FILE_DIR + "/" + id + EWSN[i] + textDatas[0] + "_result.jpg"; //이미지 경로 찾기
				else
					continue;
			}

			// 분석 결과
			int time = Integer.parseInt(textDatas[0]);
			int hour = time / 3600 % 24 + 9;
			int min = (time % 3600) / 60;
			int sec = time % 60;
			String timeLabel = "" + hour + "시 " + min + "분 " + sec + "초"; 
			String dirLabel = "정면 : " + textDatas[1]
							+ "대 후면 : " + textDatas[2]
							+ "대 측면 : " + textDatas[3] + "대";

			// 신호등 상태
			String light = "";
			for (int j = 4; j < 8; j++) {
				if (textDatas[j].equals("1")) {
					light = IMAGE_DIR + LIGHT[j - 4] + ".png";
					break;
				}
			}
			
			/* map에 저장 */
			Map<String, String> map = new HashMap<>();
			map.put("imgPath", imgPath);
			map.put("timeLabel", timeLabel);
			map.put("dirLabel", dirLabel);
			map.put("light", light);
			list.add(map);
		}

		result.put("items", list);

		return result;
	}

}