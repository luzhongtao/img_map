<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>地图热点效果-鼠标经过弹出提示信息</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script src="${ctx}/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        /*.map img { width:496px; height: 415px; }*/
        .mapDiv { width:140px; height:61px; padding: 5px; color:#369; background: url('${ctx}/img/bg.gif') no-repeat; position:absolute; display: none; word-break:break-all; }
    </style>

    <script type="text/javascript">
        $(document).ready(function(){
            $("area").each(function(){
                var $x=-70;
                var $y=-80;
                var name=$(this).attr("alt");
                var title = $(this).attr("title");
                $(this).mouseover(function(e){
                    var index_num=$(this).index();
                    var dom="<div class='mapDiv'><p><span class='name'></span><span class='num'></span></p></div>";
                    $("body").append(dom);
                    $(".name").text(title);
//                    $(".num").text(index_num)
                    $(".mapDiv").css({
                        top: (e.pageY + $y)+"px",
                        left: (e.pageX + $x)+"px"
                    }).show("fast");
                }).mouseout(function(){
                            $(".mapDiv").remove();
                        }).mousemove(function(e){
                            $(".mapDiv").css({
                                top: (e.pageY + $y)+"px",
                                left: (e.pageX + $x)+"px"
                            })
                        });
            });
        })
    </script>
</head>
<body>
<div class="map">
    <img border="0" usemap="#Map" src="http://sandbox.runjs.cn/uploads/rs/22/6i8wcrz5/mm.jpg" />
    <map name="Map" id="Map">
        <area id="beijing" alt="alt" title="美女" href="http://www.baidu.com" coords="200,200,300,300" shape="rect">

    </map>
</div>
</body>
</html>