package com.laputa.server.workers;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import java.io.FileInputStream;
import java.security.cert.X509Certificate;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * The Laputa Project.
 * Created by Sommer
 * Created on 01.05.17.
 */
public class CertificateRenewalWorker implements Runnable {

    private static final Logger log = LogManager.getLogger(CertificateRenewalWorker.class);


    private final int renewBeforeDays;

    public CertificateRenewalWorker(  int renewBeforeDays) {

        this.renewBeforeDays = renewBeforeDays;
    }

    @Override
    public void run() {

    }

    private static long getDateDiff(Date date2) {
        long now = System.currentTimeMillis();
        return TimeUnit.MILLISECONDS.toDays(date2.getTime() - now);
    }

    private static Date getNowDatePlusDays(int days) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, days);
        return cal.getTime();
    }
}
