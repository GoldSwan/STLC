package kr.ac.hansung.cse.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/upload/{serverId}", method = RequestMethod.POST)
	String uploadFileHandler(HttpServletRequest request, @PathVariable("serverId") int serverId, @RequestParam("file") MultipartFile file) {
		if (file.isEmpty())
			return "searchdata";

		String rootDir = request.getSession().getServletContext().getRealPath("/");
		Path savePath = Paths.get(rootDir + "/resources/files/" + serverId + "/" + file.getOriginalFilename());
		try {
			file.transferTo(new File(savePath.toString()));
		} catch (IOException e) {
			e.printStackTrace();
			return "searchdata";
		}
		
		return "";
	}
}
