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

import kr.ac.hansung.cse.service.TokenService;

@Controller
public class MessageController {
	private final String serverKey = "AAAAc4cstQs:APA91bHmizdDtgS46SfpWAU34kXYHE0DdfzpA33TzgGq162DzTZFPJsAvQvQqncrxHrOCYj89aZbMMls4b-d-mbgjSVZfil28t6UIi6DQwy6eWps7pP03FAHexfJ2vKH7_WigFYlgol7";

	@Autowired
	private TokenService tokenService;
	
	@RequestMapping("/messageTest")
	public String messageTest() {
		return "messageTest";
	}

	@RequestMapping("/sendMessage")
	public String sendMessage(@RequestParam("msg") String msg) {
		List<String> tokenValues = tokenService.getTokenValues();
		String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1); // 메시지 고유 ID
		boolean SHOW_ON_IDLE = true; // 앱 활성화 상태일때 보여줄것인지
		int LIVE_TIME = 1; // 앱 비활성화 상태일때 FCM가 메시지를 유효화하는 시간
		int RETRY = 2; // 메시지 전송실패시 재시도 횟수

		Sender sender = new Sender(serverKey);
		Message message = new Message.Builder().collapseKey(MESSAGE_ID).delayWhileIdle(SHOW_ON_IDLE)
				.timeToLive(LIVE_TIME).addData("message", msg).build();
		MulticastResult multicastResult = null;
		try {
			multicastResult = sender.send(message, tokenValues, RETRY);
		} catch (IOException e) {
			//e.printStackTrace();
		}

		if (multicastResult != null) {
			List<Result> resultList = multicastResult.getResults();
			for (Result result : resultList) {
				System.out.println(result.getErrorCodeName());
			}
		}

		return "messageTest";
	}

}
