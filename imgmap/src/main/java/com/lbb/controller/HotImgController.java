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

import com.lbb.util.Json;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Luzt
 * <p/>
 * Author: Luzt
 * Date: 2015/09/05
 * Time: 16:18
 */
@Controller
@RequestMapping(value="/hotImg")
public class HotImgController {
    Logger logger = LoggerFactory.getLogger(HotImgController.class);

    @RequestMapping(value = "/saveHotImg.html")
//    @ResponseBody
    public String saveHotImg(String hotImgStr) {
        System.out.println(hotImgStr);
        Json json = new Json();
        boolean isTrue = true;

        if (isTrue){
            json.setSuccess(true);
            json.setMsg("保存成功");
        }else {
            json.setSuccess(false);
            json.setMsg("保存失败");
        }

        return "edit";

    }
}
