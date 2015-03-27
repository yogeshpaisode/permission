/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Test;

import java.net.URL;

/**
 *
 * @author Yogesh
 */
public class Test_3 {

    public Test_3() {
    URL url=  getClass().getResource("1.txt");
    System.out.print(url.getPath().substring(1));
    }

    
    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       new Test_3();
       
    } 
}
