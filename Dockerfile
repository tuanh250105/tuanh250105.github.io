# Sử dụng OpenJDK 11 làm base image
FROM openjdk:11-jdk-slim

# Cài đặt Apache Tomcat 9
ENV TOMCAT_VERSION=9.0.109
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Tạo user tomcat và cài đặt dependencies
RUN apt-get update && \
    apt-get install -y wget curl && \
    groupadd -r tomcat && \
    useradd -r -g tomcat tomcat && \
    mkdir -p ${CATALINA_HOME} && \
    cd /tmp && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION}/* ${CATALINA_HOME}/ && \
    rm -rf /tmp/apache-tomcat-${TOMCAT_VERSION}* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Thiết lập quyền cho Tomcat
RUN chown -R tomcat:tomcat ${CATALINA_HOME} && \
    chmod +x ${CATALINA_HOME}/bin/*.sh

# Cài đặt Ant để build project
RUN apt-get update && \
    apt-get install -y ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Thiết lập working directory
WORKDIR /app

# Copy source code và build files
COPY build.xml ./
COPY src/ ./src/
COPY WebContent/ ./WebContent/
COPY lib/ ./lib/

# Copy và cài đặt JAR dependencies
COPY WebContent/WEB-INF/lib/*.jar ${CATALINA_HOME}/lib/

# Build WAR file
# Ensure Ant knows where Tomcat is installed so the build.xml's javac classpath (tomcat.home/lib)
# points to the container Tomcat installation. Also use JDK image so javac is available.
RUN ant -Dtomcat.home=${CATALINA_HOME} war

# Install entrypoint script that will deploy the WAR as ROOT and adjust port at runtime
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

### Do not copy the WAR into webapps at build-time; the entrypoint will place it at runtime
### This avoids Tomcat unpacking the default ROOT before we can remove/replace it on some platforms.

# Tạo thư mục cho logs và config
RUN mkdir -p ${CATALINA_HOME}/logs && \
    mkdir -p ${CATALINA_HOME}/conf

# Expose port 8080
EXPOSE 8080

# Thiết lập environment variables
ENV CATALINA_OPTS="-Xmx512m -Xms256m"

# Ensure entrypoint runs as root to modify files, then switch to tomcat for runtime
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8080/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]
