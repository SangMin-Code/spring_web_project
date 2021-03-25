package org.zerock.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/replies/")
@RestController
@Slf4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
}
