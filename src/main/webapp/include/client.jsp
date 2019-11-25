<%@ page import="ca.snappay.openapi.DefaultOpenApiClient" %>
<%@ page import="ca.snappay.openapi.config.BasicConfigurationHolder" %>
<%@ page import="ca.snappay.openapi.constant.SignType" %>
<%@ page import="ca.snappay.openapi.constant.Language" %>

<%
    BasicConfigurationHolder configHolder = new BasicConfigurationHolder();
    configHolder.setGatewayHost("open-pre.snappay.ca");
    configHolder.setMerchantNo("901900010459");
    configHolder.setAppId("af58d5955f931403");
    configHolder.setLanguage(Language.ENGLISH);
    configHolder.setSignType(SignType.MD5);
    configHolder.setPrivateKey("3d9b08a3c9eec7fd5b2f3c4c238c676f");
    DefaultOpenApiClient client = new DefaultOpenApiClient(configHolder);
%>