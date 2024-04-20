/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;


/**
 *
 * @author hp
 */
public class Helper {
    
    public static boolean deleteFile(String path){
        boolean f=false;
        
        try{
            File file1 = new File(path);
            f= file1.delete();
            
            
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
         
    }
    public static boolean saveFile(InputStream is,String path){
        boolean f=false;
        
        try{
            byte b[]=new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            f=true;
            
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}
