package org.zerock.controller.old;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.old.ApiVO;
import org.zerock.domain.old.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/*")
@Log4j
public class ApiController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		
		return "こんにちは";
	}
	
	@GetMapping(value = "/getData", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
												 MediaType.APPLICATION_XML_VALUE })
	public ApiVO getData() {
		
		return new ApiVO(112, "スター", "ロード");
	}
	
	@GetMapping(value = "/getList")
	public List<ApiVO> getList() {
		
		return IntStream.range(1, 10).mapToObj(i -> new ApiVO(i, "firstName" + i, "lastName" + i)).collect(Collectors.toList());
	}
	
	@GetMapping(value = "/getMap")
	public Map<String, ApiVO> getMap() {
		
		Map<String, ApiVO> map = new HashMap<>();
		map.put("First", new ApiVO(111, "아임", "그루트"));
		
		return map;
	}
	
	@GetMapping(value = "/check", params = { "height", "weight" })
	public ResponseEntity<ApiVO> check(double height, double weight) {
	
		ApiVO vo = new ApiVO(0, "" + height, "" + weight);
		
		ResponseEntity<ApiVO> result = null;
		
		if (height < 150) {
			result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
		} else {
			result = ResponseEntity.status(HttpStatus.OK).body(vo);
		}
		
		return result;
	}
	
	@GetMapping("/product/{cat}/{pid}")
	public String[] getPath(@PathVariable("cat") String cat, @PathVariable("pid") Integer pid){
		
		return new String[] { "category : " + cat, "productId : " + pid };
	}
	
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		log.info("convert.......ticket : " + ticket);
		
		return ticket;
	}
}
