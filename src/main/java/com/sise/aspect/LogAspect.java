package com.sise.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/*日志切面*/
@Aspect
@Component
public class LogAspect {

    //日志记录器
    private final Logger logger= LoggerFactory.getLogger(this.getClass());

    //切面方法
    @Pointcut("execution(* com.sise.web.*.*(..))")
    public void log(){

    }

    //切面方法之前执行:获取请求的相关日志信息
    @Before("log()")
    public void doBefore(JoinPoint joinPoint){
        //获取请求
        ServletRequestAttributes attributes= (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request=attributes.getRequest();

        //获取请求相关信息:请求的url,ip地址，请求执行的类名和方法名，请求参数
        String url=request.getRequestURL().toString();
        String ip=request.getRemoteAddr();
        String classMethod=joinPoint.getSignature().getDeclaringTypeName()+":"+joinPoint.getSignature().getName();
        Object[] args=joinPoint.getArgs();
       RequestLog requestLog=new RequestLog(url,ip,classMethod,args);

       logger.info(("Request: {} "),requestLog);

    }

    //切面方法之后执行
    @After("log()")
    public void doAfter(){
       // logger.info("~~~~~~~~doAfter~~~~~~~~~");
    }


    //切面方法返回之后执行
    @AfterReturning(returning = "result",pointcut = "log()")
    public void doAfterRuturn(Object result){
        logger.info("Result:{}"+result);
    }






    //日志信息内部类
    private class RequestLog{
        private String url;
        private String ip;
        private String classMethod;
        private Object[] args;

        public RequestLog(String url, String ip, String classMethod, Object[] args) {
            this.url = url;
            this.ip = ip;
            this.classMethod = classMethod;
            this.args = args;
        }

        @Override
        public String toString() {
            return "RequestLog{" +
                    "url='" + url + '\'' +
                    ", ip='" + ip + '\'' +
                    ", classMethod='" + classMethod + '\'' +
                    ", args=" + Arrays.toString(args) +
                    '}';
        }
    }








}
