package com.kh.spring.log4j;

import org.apache.log4j.Logger;

import lombok.extern.log4j.Log4j;

//@Log4j // pom.xml -> <scope>compile</scope>: 안 하면 에러 
public class Log4jTest {

	private static final Logger log = Logger.getLogger(Log4jTest.class);
	
	/**
	 * [Log4j]
	 * logging level 선택 가능
	 * 
	 * 1. fetal: 심각한 에러 출력 시
	 * 2. error: 요청 처리 중 에러 발생한 경우
	 * 3. warn: 당장 프로그램 실행에는 문제없지만, 잠재적 오류 가능성 있을 때
	 * 4. info: 정보성 메세지
	 * 5. debug: 개발 시 로깅(운영 시에는 필요없음)
	 * 6. trace: 디버그 시 세밀한 단위 지정 | 메소드 시작 ~ 끝 이런 식으로 사용
	 */
	
	public static void main(String[] args) {
		
		log.fatal("fatal"); 
		log.error("error");
		log.warn("warn"); 
		log.info("info");
		log.debug("debug"); 
		log.trace("trace");

		/** 
		 * log4j.xml에서 
		 * 	
		 	<logger name="com.kh.spring">
			<level value="info" />
			</logger>
			
			info로 바꾸니까
			debug 메세지가 안 나옴
			
			상위 메세지만 찍힘
			
			개발 시에는 대부분 info
		 */

	}

}
