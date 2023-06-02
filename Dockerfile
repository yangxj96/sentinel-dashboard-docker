FROM amazoncorretto:8u362-alpine3.17-jre

MAINTAINER yangxj96 "yangxj96@126.com"

# 设置环境变量
ENV BASE_DIR="/sentinel"\
    JAVA_HOME="/usr/lib/jvm/java-8-amazon-corretto" \
    JAVA="/usr/lib/jvm/java-8-amazon-corretto/bin/java" \
    JVM_XMS="512m" \
    JVM_XMX="512m" \
    JVM_XMN="256m" \
    JVM_MS="64m" \
    JVM_MMS="160m" \
    SENTINEL_VERSION="1.8.6" \
    SESSION_TIMEOUT="7200" \
    PROJECT_NAME="sentinel-dashboard" \
    AUTH_ENABLED="true" \
    SENTINEL_DASHBOARD_AUTH_USERNAME="sentinel" \
    SENTINEL_DASHBOARD_AUTH_PASSWORD="sentinel" \
    SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS="0" \
    SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS="0" \
    SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS="60000" \
    SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS="0" \
    SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS="60000" \
    SERVER_SERVLET_SESSION_COOKIE_NAME="sentinel_dashboard_cookie" \
    TIME_ZONE="Asia/Shanghai"

# 创建基础目录
RUN mkdir /sentinel

WORKDIR $BASE_DIR

# 添加必备环境变量
RUN apk add --no-cache openssl ncurses-libs libstdc++

# 添加sentinel-dashboard文件
COPY app/sentinel-dashboard-${SENTINEL_VERSION}.jar /sentinel

# 设置时间同步
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

# 复制启动脚本
ADD bin/docker-startup.sh bin/docker-startup.sh

RUN mkdir -p logs \
	&& cd logs \
	&& touch start.out \
	&& ln -sf /dev/stdout start.out \
	&& ln -sf /dev/stderr start.out

EXPOSE 8080

RUN chmod +x bin/docker-startup.sh

ENTRYPOINT ["/bin/ash","bin/docker-startup.sh"]
