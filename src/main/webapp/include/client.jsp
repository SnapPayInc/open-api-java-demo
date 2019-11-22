<%@ page import="ca.snappay.openapi.DefaultOpenApiClient" %>
<%@ page import="ca.snappay.openapi.config.BasicConfigurationHolder" %>
<%@ page import="ca.snappay.openapi.constant.SignType" %>
<%@ page import="ca.snappay.openapi.constant.Language" %>

<%
    BasicConfigurationHolder configHolder = new BasicConfigurationHolder();
    configHolder.setGatewayHost("open-dev.snappay.ca");
    configHolder.setLanguage(Language.ENGLISH);
    configHolder.setMerchantNo("901900000186");
    configHolder.setAppId("736e836447e9e888");
    configHolder.setSignType(SignType.MD5);
    configHolder.setPrivateKey("dd35356298681f89ad7ce65b26163a63");
    DefaultOpenApiClient client = new DefaultOpenApiClient(configHolder);
%>