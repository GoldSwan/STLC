package kr.ac.hansung.cse.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

import kr.ac.hansung.cse.service.UserService;

@Controller
public class MessageController {
	private final String simpleApiKey = "AAAAFuSEfiQ:APA91bHylrJSSFN--RHK2TTl8s0oi4p3VPpgBU5NjqtyKA2diQeBPWDH3dFEr-kp3N5Xh1YwnVT1wkGlf2nabjT2jB5XILTRMZdaHZDAIJoR62tGA4HSqrQ1XUc0tfv27l-1ZySXLr_v"; // \"AIzaSyBQepjtC55YCawR7oVyo6-5E_J2c6xcsBs\";
	@Autowired
	private UserService userService;
	
	@RequestMapping("/messageSetting")
	public String messageSetting() throws IOException {

		return "messageSetting";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(@RequestParam("msg") String msg) throws IOException {
		List<String> token = userService.getUsers();
		String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1); // 메시지 고유 ID
		boolean SHOW_ON_IDLE = true; // 앱 활성화 상태일때 보여줄것인지
		int LIVE_TIME = 1; // 앱 비활성화 상태일때 FCM가 메시지를 유효화하는 시간
		int RETRY = 2; // 메시지 전송실패시 재시도 횟수

		Sender sender = new Sender(simpleApiKey);
		Message message = new Message.Builder().collapseKey(MESSAGE_ID).delayWhileIdle(SHOW_ON_IDLE)
				.timeToLive(LIVE_TIME).addData("message", msg).build();
		MulticastResult multicastResult = sender.send(message, token, RETRY);

		if (multicastResult != null) {
			List<Result> resultList = multicastResult.getResults();
			for (Result result : resultList) {
				System.out.println(result.getErrorCodeName());
			}
		}
		
		return "home";
	}

}
