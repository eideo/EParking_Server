package com.laputa.service;

import com.laputa.service.business.ap.impl.ApService;
import com.laputa.service.business.berth.impl.BerthService;
import com.laputa.service.business.floor.impl.FloorService;
import com.laputa.service.business.parking.impl.ParkingService;
import com.laputa.service.business.sensor.impl.SensorService;
import com.laputa.service.business.sensorinfo.impl.SensorInfoService;
import com.laputa.service.system.citycode.impl.CityCodeService;
import com.laputa.util.FileUtil;
import com.laputa.util.PageData;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

/**
 * Created by jiangs on 2017/4/26.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
        "classpath:spring/ApplicationContext-main.xml",
        "classpath:spring/ApplicationContext-dataSource.xml"
//        "classpath:spring/ApplicationContext-redis.xml",
//        "classpath:spring/ApplicationContext-shiro.xml"

})

public class SensorTest {
    @Autowired
    SensorService sensorService;
    @Autowired
    ParkingService parkingService;
    @Autowired
    SensorInfoService sensorInfoService;
    @Autowired
    CityCodeService cityCodeService;
    @Autowired
    ApService apService;

    @Autowired
    FloorService floorService;

    @Autowired
    BerthService berthService;

    @Test
    public void testFloorByID() throws Exception {
        PageData pd = new PageData();
        pd.put("PARKING_ID",1);
        List<PageData> dataList = floorService.listAllByFloorid(pd);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }



    @Test
    public void testSensor() throws Exception {
        List<PageData> dataList = sensorService.listAll(null);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }


    @Test
    public void testSensorInfor() throws Exception {
        List<PageData> dataList = sensorInfoService.listAll(null);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }


    @Test
    public void testAP() throws Exception {
        List<PageData> dataList = apService.listAll(null);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }

    @Test
    public void testFloor() throws Exception {
        List<PageData> dataList = floorService.listAll(null);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }

    @Test
    public void testBerth() throws Exception {
        List<PageData> dataList = berthService.listAll(null);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }


    @Test
    public void testBerthbyFloor() throws Exception {

//        pd.
        List<PageData> dataList = berthService.listAllByFloor(1);
        System.out.println(dataList.size());
        for(PageData dd:dataList) {
            System.out.println(dd);
        }
    }


    @Test
    public void testParking() throws Exception {

       int value = Integer.parseInt(parkingService.getParkingCount("").get("parkingCount").toString());
        System.out.println(value);
    }
    @Test
    public void insertCityCode() throws Throwable {
        byte[]  content =  FileUtil.getContent("e:/citycode.txt");
        String str = new String(content, "gbk");
//        str = FileUtil.recover(str);
//        System.out.println(str);
        String[] strs = str.split(";");
        for(String s:strs){
            System.out.println(s);
            String[] dd = s.split(",");
//            for(String d:dd){
//                System.out.println(d);
//            }

            if(dd.length>1){



                PageData pd = new PageData();

                pd.put("STATE", dd[4]);
                pd.put("CITY", dd[3]);
                pd.put("CITY_CODE",dd[0]);
                pd.put("DISTRICT", dd[1]);


                cityCodeService.save(pd);

            }else {
                System.out.println("error");
            }



        }



    }

    @Test
    public void insertParking() throws Throwable {
       byte[]  content =  FileUtil.getContent("e:/info");
        String str = new String(content, "gbk");
//        str = FileUtil.recover(str);
//        System.out.println(str);
        String[] strs = str.split("id=");
        for(String s:strs){
//            System.out.println(s);
            String[] dd = s.split("label=");

            if(dd.length>1){
                String coordinate = dd[0].replace(" ","");
                System.out.println("coordinate:"+coordinate);
                String[] coords = coordinate.split(",");
                double longitude =Double.parseDouble(coords[0]);
                double latidute = Double.parseDouble(coords[1]);
                System.out.println("longitude:"+longitude+" latidute:"+latidute);
                String name = dd[1].split(" ")[0];
                System.out.println("name:"+name);

                Date date = new Date();

                PageData pd = new PageData();

                pd.put("NAME", name);
                pd.put("CITY", "北京");
                pd.put("CITY_CODE", "00301");
                pd.put("ADDRESS", name);
                pd.put("LONGITUDE",longitude );
                pd.put("LATITUDE", latidute);
                pd.put("CREATE_TIME",date.getTime()) ;
                pd.put("GROUPID", 1);

                parkingService.save(pd);

            }else {
                System.out.println("error");
            }



        }



    }




}
