package kr.ac.hansung.cse.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {
	
	@RequestMapping(value = "/searchdata")
	public String fileUpload(){
		return "searchdata";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	String uploadFileHandler(@RequestParam("file") MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				String rootPath = "C:\\Users\\Swan\\Desktop\\Javaworkspace\\KKCC-master\\KKCC-master\\src\\main\\webapp\\resources\\files";
				File dir = new File(rootPath + File.separator);
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + "test.jpg");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("Server File Location="
						+ serverFile.getAbsolutePath());
				
				Thread.sleep(5000);//refresh 되기 전까지 5초 대기
				
				return "uploadcomplete";
			} catch (Exception e) {
				return "You failed to upload "+" => " + e.getMessage();
			}
		} else {
			return "You failed to upload " +" because the file was empty.";
		}
	}
}
