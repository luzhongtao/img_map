/**
 * Copyright 2013 Future TV, Inc.
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p/>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p/>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.lbb.controller;

import com.lbb.util.FileUpload;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by Luzt
 * <p/>
 * Author: Luzt
 * Date: 2015/09/05
 * Time: 11:24
 */
@Controller
@RequestMapping(value="/img")
public class FileUploadController {

    Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    @RequestMapping(value="/img.html")
    public String loginPage(){
        return "upload";
    }

    @RequestMapping(value="/preview.html")
    public String previewImg(){
        return "preview";
    }
    @RequestMapping(value="/edit.html")
    public String editPage(){
        return "edit";
    }

    @RequestMapping("/upload.html")
    public String upload(@RequestParam(value="studentPhoto", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response,RedirectAttributes attr) throws IOException {
        String filePath = FileUpload.uploadFile(file, request);
        logger.info("filePath:" + filePath);
//            response.setContentType("text/html;charset=utf8");
//            response.getWriter().write("<img src=http://localhost:8088/imgmap/img/'"+filePath+"'/>");
        request.setAttribute("imgname",filePath);
        return "edit";
    }

    @RequestMapping("download.html")
    public void download(String fileName, HttpServletResponse response) throws IOException {
        OutputStream os = response.getOutputStream();
        try {
            response.reset();
            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            response.setContentType("image/jpeg; charset=utf-8");
            os.write(FileUtils.readFileToByteArray(FileUpload.getFile(fileName)));
            os.flush();
        } finally {
            if (os != null) {
                os.close();
            }
        }
    }



}