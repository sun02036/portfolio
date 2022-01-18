package com.kh.spring.log4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Slf4jTest {

	//	private static final Logger log = LoggerFactory.getLogger(Slf4jTest.class);
	
	public static void main(String[] args) {
		
		// 순서 기억
		log.error("{}", "error");
		log.warn("{}", "warn");
		log.info("{}", "info");
		log.debug("{}", "debug");
		log.trace("{}", "trace");
		
	}

}
