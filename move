/**
 * Created by huhui on 2016/6/16.
 */
function getstyle(obj,attr){
    if(obj.currentStyle){
        return obj.currentStyle[attr];
    }else{
        return getComputedStyle(obj,null)[attr];
    }
}
function move(obj,attr,fn){//获取的obj:html标签 attr：属性：目标值{width：200，height：300} fn:回调函数
    clearInterval(obj.timer);
    obj.timer=setInterval(function(){
        var mark=true;
        for(var tem in attr){
            if(tem=='opacity'){
                var cur=parseFloat(getstyle(obj,tem))*100;
                var speed=Math.round(attr[tem]*100)-cur;
                speed=speed>0?Math.ceil(speed/10):Math.floor(speed/10);
                if(cur!=Math.round(attr[tem]*100)){
                    mark=false;
                    cur+=speed;
                    obj.style[tem]=cur/100;
                }
            }else{
                var cur=parseInt(getstyle(obj,tem));
                var speed=attr[tem]-cur;
                speed=speed>0?Math.ceil(speed/10):Math.floor(speed/10);
                if(attr[tem]!=cur){
                    mark=false;
                    cur+=speed;
                    obj.style[tem]=cur+'px';
                }
            }
        }
        if(mark){
            clearInterval(obj.timer);
            if(fn){
                fn();
            }
        }
    },20);

}
