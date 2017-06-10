package com.laputa.service;


import com.laputa.service.business.sensor.impl.SensorService;
import com.laputa.util.PageData;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class UserDaoImplTest {
	
	private ApplicationContext applicationContext;

	//在setUp这个方法得到spring容器
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("classpath:spring/ApplicationContext-main.xml","classpath:spring/ApplicationContext-dataSource.xml");
	}

	@Test
	public void testFindUserById() throws Exception {
		SensorService sensorService = (SensorService) applicationContext.getBean("sensorService");
		List<PageData> dataList = sensorService.listAll(null);
		for(PageData pd :dataList){
			System.out.println(pd.toString());
		}


	}

}
