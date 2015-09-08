package com.lbb.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class FileUpload {
  
    public static final String FILE_PATH = "/upload/";
    static  Logger logger = LoggerFactory.getLogger(FileUpload.class);

    //文件上传  
    public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String localFilePath = request.getSession().getServletContext().getRealPath("/");
        logger.info(localFilePath);
        File tempFile = new File(localFilePath+FILE_PATH, new Date().getTime() + String.valueOf(fileName));
        if (!tempFile.getParentFile().exists()) {  
            tempFile.getParentFile().mkdir();  
        }  
        if (!tempFile.exists()) {  
            tempFile.createNewFile();  
        }  
        file.transferTo(tempFile);  
        return FILE_PATH + tempFile.getName();
    }  
  
    public static File getFile(String fileName) {  
        return new File(FILE_PATH, fileName);  
    }  
}  