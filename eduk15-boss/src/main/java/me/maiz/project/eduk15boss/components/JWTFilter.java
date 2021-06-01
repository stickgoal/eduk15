package me.maiz.project.eduk15boss.components;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.Strings;
import io.jsonwebtoken.Claims;
import me.maiz.project.eduk15boss.common.JwtUtils;
import me.maiz.project.eduk15boss.common.Result;
import me.maiz.project.eduk15boss.model.Operator;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.AuthenticatingFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class JWTFilter extends AuthenticatingFilter {

    private static final Logger logger = LoggerFactory.getLogger(JWTFilter.class);

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        //全局允许跨域
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String requestURI = httpServletRequest.getRequestURI();

        logger.info("进入预处理:{}-{}",httpServletRequest.getMethod(),requestURI);

        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", httpServletRequest.getHeader("Access-Control-Request-Headers"));
        // 跨域时会首先发送一个 option请求，这里我们给 option请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(HttpStatus.OK.value());
            return false;
        }


        return super.preHandle(request, response);

    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        logger.info("进入isAccessAllowed");
        if(!isJwtValid(request)){
            return false;
        }
        return super.isAccessAllowed(request, response, mappedValue);
    }

    private boolean isJwtValid(ServletRequest req){
        HttpServletRequest request = (HttpServletRequest) req;
        String token = request.getHeader(JwtUtils.AUTH_TOKEN_NAME);
       if(Strings.isNullOrEmpty(token)){
           logger.info("JWT未提供");
           return false;
       }
       try {
           Operator operator = JwtUtils.parseJwt(token);
           return operator!=null;
       }catch (Exception e){
           logger.info("JWT过期或者其他错误，{}，{}",e.getMessage());
           request.setAttribute("AUTHC_FAIL","AUTHC_FAIL");
           return false;
       }
    }

    /**
     * 从请求中提取Token
     * @param req
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest req, ServletResponse response) throws Exception {
        logger.info("进入createToken");

        HttpServletRequest request = (HttpServletRequest) req;
        String token = request.getHeader(JwtUtils.AUTH_TOKEN_NAME);
        if(Strings.isNullOrEmpty(token)){
            throw new UnknownAccountException("请求不合法，JWT token未传入");
        }

        return new JwtToken(token);
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        logger.info("进入onAccessDenied");

        HttpServletRequest httpServletRequest = WebUtils.toHttp(request);
        HttpServletResponse httpServletResponse = WebUtils.toHttp(response);
        String token = httpServletRequest.getHeader(JwtUtils.AUTH_TOKEN_NAME);
        if(Strings.isNullOrEmpty(token)){
            fail(httpServletRequest, httpServletResponse);
            return false;
        }

        boolean executeLogin = executeLogin(httpServletRequest, httpServletResponse);
        if(!executeLogin){
            fail(httpServletRequest, httpServletResponse);
        }
        return executeLogin;
    }

    private void fail(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        // 返回401
        httpServletResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        // 设置响应码为401或者直接输出消息
        String url = httpServletRequest.getRequestURI();
        ObjectMapper objectMapper = new ObjectMapper();
        boolean isAuthc =httpServletRequest.getAttribute("AUTHC_FAIL")!=null;
        Result fail = Result.fail(isAuthc?"您未登录，请先登录":"未授权的请求，请先登录或取得授权");
        httpServletResponse.setContentType("application/json;charset=utf-8");
        httpServletResponse.getWriter().print(objectMapper.writeValueAsString(fail));
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request, ServletResponse response) throws Exception {
        //TODO 刷新token
        logger.info("进入onLoginSuccess");

        return super.onLoginSuccess(token, subject, request, response);
    }
}
