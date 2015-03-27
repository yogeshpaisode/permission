/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.report;

import java.net.URL;

/**
 *
 * @author Yogesh
 */
public class ReportName {

    public String getReportName() {
        URL url = getClass().getResource("permision.jasper");
        return url.getPath().substring(1);

    }
    
    public String getEmblemName() {
        URL url = getClass().getResource("emblem.jpg");
        return url.getPath().substring(1);

    }
    
    public String getLogoName() {
        URL url = getClass().getResource("logo.jpg");
        return url.getPath().substring(1);

    }
    
    public String getSignName() {
        URL url = getClass().getResource("sign.jpg");
        return url.getPath().substring(1);

    }
}
