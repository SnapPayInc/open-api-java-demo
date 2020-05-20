FROM maven:3 as builder
RUN yum install zip -y
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN zip -r src/main/webapp/demo.zip -x open-api-java-demo.iml Dockerfile Makefile @ .
RUN mvn install

FROM tomcat:8.5-jdk8
ENV SNAPPAY_MERCHANT_NO=901800000116 SNAPPAY_APP_ID=9f00cd9a873c511e SNAPPAY_PRIVATE_KEY=7e2083699dd510575faa1c72f9e35d43
COPY --from=builder /usr/src/app/target/openapi-java-demo-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
