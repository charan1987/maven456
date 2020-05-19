FROM java:8
//ARG WEBCONTEXT=simplewebappdev

RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.20/bin/apache-tomcat-8.0.20.tar.gz
RUN tar xzf apache-tomcat-8.0.20.tar.gz
COPY trucks/target/trucks-1.3.war apache-tomcat-8.0.20/webapps/
RUN mv apache-tomcat-8.0.20/webapps/trucks-1.3.war apache-tomcat-8.0.20/webapps/trucks.war
EXPOSE 8080
CMD apache-tomcat-8.0.20/bin/startup.sh && tail -f apache-tomcat-8.0.20/logs/catalina.out
