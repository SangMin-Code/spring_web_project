package org.zerock.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/sample/*")
@Slf4j
public class SampleController {

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) { SimpleDateFormat
	 * dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 * binder.registerCustomEditor(java.util.Date.class, new
	 * CustomDateEditor(dateFormat, false)); }
	 */
	
	@RequestMapping("")
	public void basic() {
		log.info("basic..............");
	}
	@RequestMapping(value = "/basic",method = {RequestMethod.GET, RequestMethod.POST})
	public void basicGet() {
		log.info("basic get................");
		
	}
	
	@GetMapping("/basicOnlyGet")
	public void basicGet2() {
		log.info("basic get only get.....");
	}
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info(""+dto);
		return "ex01";
	}

	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, 
					@RequestParam("age") int age) {
		
		log.info("name :"+ name);
		log.info("age :" + age );
		
		return "ex02";
		
	}
	
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String>ids) {
		log.info("ids:" + ids);
		return "ex02List";
	}
	
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		log.info("array ids:" + Arrays.toString(ids));
		return "ex02Array";
	}
	
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList list) {
		log.info("list dtos: "+list);
		return "ex02Bean";	
	}
	
	@GetMapping("/ex03")
	public String ex03(TodoDTO todo) {
		log.info("todo : ",todo);
		return "ex03";
	}
	
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto :"+dto);
		log.info("page :"+page);
		
		return "/sample/ex04";
	} 
	/**
	 * ModelAttribute -> 받은 데이터를 강제로 화면까지 보내줌, 기본형은 받은 데이터를 화면까지
	 * 보내주지 않으므로 필요하면 ModelAttribute anntation 사용, 객체는 받은 데이터를 화면까지 기본적으로 보냄
	 */
	
	@GetMapping("/ex05")
	public void ex05() { 
		log.info("/ex05.......");
	/**
	 * 리턴타입이 void일때 해당 URL의 경로를 그대로 jsp 파일의 이름으로 사용
	 * servlet-context.xml의 설정을 땨름
	 */
	}
	
	/**
	 * return 이 String일때 일반적으로 jsp파일의 이름을 의미. 
	 * 상황에 따라 다른 화면을 보여줄 필요가 있을 경우에 유용하게 사용
	 * String 타입에는 특별한 키워드를 붙여서 사용할 수 있다.
	 *  redirect: 리다이렉트 방식으로 처리
	 *  forward : 포워드 방식으로 처리
	 */
	
	/*
	 * VO,DTO 같은 객체타입의 지정일땐 주로 JSON 데이터를 만들어내는 용도로 사용
	 * 이를 위해서는 jackson-databind 라이브러리 필요
	 */
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06......");
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		return dto;
	}

	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		log.info("/ex07.......");
		
		//{"name":"홍길동"}
		String msg = "{\"name\":\"홍길동\"}";
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type","application/json;charset=UTF-8");
		return new ResponseEntity<>(msg,header,HttpStatus.OK);	
	}
	/*
	 * HTTP 프로토콜의 헤더를 다루는 경우로 HttpServletRequest나 httpServletResponse를
	 * 직저 핸들링하지 않아도 작업이 가능하도록 작성되어있기 때문에 ResponseEntity를 통해 처리한다.
	 */
	
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload...........");
	}
	
	@PostMapping("/exUploadPost")
	//@RequestMapping(value="exUploadPost", method= {RequestMethod.POST})
	public void exUploadPost(ArrayList<MultipartFile> files) {
		log.info("here");
		
		files.forEach(file->{
			log.info("----------------");
			log.info("name:"+file.getOriginalFilename());
			log.info("size:"+file.getSize());
		});
	}
	
	
	
}
