<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Image Maps test</title>
    <script id="jquery_172" type="text/javascript" class="library" src="${ctx}/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery.image-maps.js"></script>
    <script type="text/javascript" language="javascript">
        $(function(){
            $('#imgMap').imageMaps();
        });
    </script>


</head>

<body>
<div id="debug"></div>
${imgname}
<div id="imgMap">
    <%--<img src="<c:out value="${imgname}"/>" name="test1" width="300" height="410" border="0" usemap="#Map" ref='imageMaps' />--%>
    <img src="http://sandbox.runjs.cn/uploads/rs/22/6i8wcrz5/mm.jpg" name="test1" width="300" height="410" border="0" usemap="#Map" ref='imageMaps' />
    <map name="Map">
        <area shape="rect" coords="28,54,202,109" href="http://www.oschina.net" />
    </map>
    <map name="Map2">

    </map>
</div>
<form id="hotImgForm" action="${ctx}/hotImg/saveHotImg.html" method="post">
    <input type="hidden" name="hotImgStr" id="hotImgStr" value=""/>

</form>
<button onclick="saveHotImgs()">保存</button>
<!--<span class="fmSpan"><a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveHotImgs()" style="width:80px;color:black">保存</a></span>-->
</body>
</html>
<script>


    function saveHotImgs(){
        var jsonData="[";
        var linkList = $('.link-conrainer').find("p");
        for(var i=0;i< linkList.length;i++){
            var link=$(linkList[i]).find("input[name='link[test1][]']").val();
            var content=$(linkList[i]).find("input[name='content[test1][]']").val();
            var rect=$(linkList[i]).find("input[name='rect[test1][]']").val();

//            console.info(link+" "+content);


            jsonData =jsonData+"{"
            jsonData = jsonData + "link:\""+link+"\",";
            jsonData = jsonData + "content:\""+content+"\",";
            jsonData = jsonData + "rect:\""+rect+"\"";
            jsonData =jsonData+"}"
            if(i<linkList.length-1){
                jsonData =jsonData+",";
            } ;
        }
        jsonData =jsonData+"]";
        console.info(jsonData);
        $('#hotImgForm').find("input[name=hotImgStr]").val(jsonData);
//        $('#hotImgForm').submit();

        formSubmit("${ctx}/hotImg/saveHotImg.html",$('#hotImgForm').serialize());



    }

    function formSubmit(url,data){
        $.ajax({
            url: url,
            type: "post",
            data: data,
            success: function (result) {
                if(result.success){
                    alert(result.msg)

                }else{
                    alert(result.msg)

                }

            }

        });
    }
</script>
