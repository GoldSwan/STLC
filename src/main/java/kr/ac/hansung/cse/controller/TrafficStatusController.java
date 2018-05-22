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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

import kr.ac.hansung.cse.service.FileService;
import kr.ac.hansung.cse.service.UserService;

@Controller
public class TrafficStatusController {
	private static final String TEXT_DIR = "/var/lib/tomcat8/webapps/STLC/resources/files";
	private static final String FILE_DIR = "/STLC/resources/files";
	private static final String[] EWSN = { "/east", "/west", "/south", "/north" }; 
	private static final String IMAGE_DIR = "/STLC/resources/images";
	private static final String[] LIGHT = { "/light-green", "/light-left", "/light-yellow", "/light-red" };

	private final String serverKey = "AAAAc4cstQs:APA91bHmizdDtgS46SfpWAU34kXYHE0DdfzpA33TzgGq162DzTZFPJsAvQvQqncrxHrOCYj89aZbMMls4b-d-mbgjSVZfil28t6UIi6DQwy6eWps7pP03FAHexfJ2vKH7_WigFYlgol7";

	@Autowired
	private FileService fileService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/trafficstatus")
	public String traffic() {
		return "trafficstatus";
	}

	@RequestMapping(value = "/ajaxtrafficstatus.do")
	public @ResponseBody Map<String, List<Map<String, String>>> getBoardList(Locale locale, Model model, HttpServletRequest request) throws IOException {
		Map<String, List<Map<String, String>>> result = new HashMap<>();
		List<Map<String, String>> list = new ArrayList<>(4);

		for (int i = 0; i < 4; i++) {
			/* text 파일 */
			byte[] baRequesterCert = fileService.getCertKey(TEXT_DIR + EWSN[i] + ".txt");
			if (baRequesterCert == null)
				continue;

			// 실시간 이미지
			String text = new String(baRequesterCert); //byte->string 변환
			String[] textDatas = text.split(" ");
			String imgPath = FILE_DIR + EWSN[i] + textDatas[0] + "_result.jpg"; //이미지 경로 찾기

			// 분석 결과
			String label = textDatas[0]
					+ "\n정면 : " + textDatas[1]
					+ "\n후면 : " + textDatas[2]
					+ "\n측면 : " + textDatas[3];

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
			map.put("label", label);
			map.put("light", light);
			list.add(map);
		}

		System.out.println(list.get(0).get("imgPath"));
		// 사고상황 인지
		byte[] stream = fileService.getCertKey(TEXT_DIR + "/global.txt");
		if (stream != null) {
			String[] textDatas = new String(stream).split(" ");
			if (textDatas[0].equals("1"))
				sendMessage("한성대 사거리 접촉 사고 발생");
			Map<String, String> map = new HashMap<>();
			map.put("remaintime", textDatas[1]);
			list.add(map);
		}

		result.put("items", list);

		return result;
	}

	/* MESSAGE */
	@RequestMapping("/messageTest")
	public String messageTest() throws IOException {
		return "messageTest";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(@RequestParam("msg") String msg) throws IOException {
		List<String> token = userService.getUsers();
		String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1); // 메시지 고유 ID
		boolean SHOW_ON_IDLE = true; // 앱 활성화 상태일때 보여줄것인지
		int LIVE_TIME = 1; // 앱 비활성화 상태일때 FCM가 메시지를 유효화하는 시간
		int RETRY = 2; // 메시지 전송실패시 재시도 횟수

		Sender sender = new Sender(serverKey);
		Message message = new Message.Builder().collapseKey(MESSAGE_ID).delayWhileIdle(SHOW_ON_IDLE)
				.timeToLive(LIVE_TIME).addData("message", msg).build();
		MulticastResult multicastResult = sender.send(message, token, RETRY);

		if (multicastResult != null) {
			List<Result> resultList = multicastResult.getResults();
			for (Result result : resultList) {
				System.out.println(result.getErrorCodeName());
			}
		}
		
		return "messageTest";
	}

}