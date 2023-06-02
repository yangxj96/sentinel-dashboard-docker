#!/bin/bash
#===========================================================================================
# JVM Configuration
#===========================================================================================
JAVA_OPT="${JAVA_OPT} -Xms${JVM_XMS} -Xmx${JVM_XMX} -Xmn${JVM_XMN}"

#===========================================================================================
# Setting system properties
#===========================================================================================
if [[ ! -z "${AUTH_ENABLED}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dauth.enabled=${AUTH_ENABLED}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_AUTH_USERNAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.auth.username=${SENTINEL_DASHBOARD_AUTH_USERNAME}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_AUTH_PASSWORD}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.auth.password=${SENTINEL_DASHBOARD_AUTH_PASSWORD}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.app.hideAppNoMachineMillis=${SENTINEL_DASHBOARD_APP_HIDE_APP_NO_MACHINE_MILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.removeAppNoMachineMillis=${SENTINEL_DASHBOARD_REMOVE_APP_NO_MACHINE_MILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.unhealthyMachineMillis=${SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.autoRemoveMachineMillis=${SENTINEL_DASHBOARD_AUTO_REMOVE_MACHINE_MILLIS}"
fi

if [[ ! -z "${SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dsentinel.dashboard.unhealthyMachineMillis=${SENTINEL_DASHBOARD_UNHEALTHY_MACHINE_MILLIS}"
fi

if [[ ! -z "${SERVER_SERVLET_SESSION_COOKIE_NAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.servlet.session.cookie.name=${SERVER_SERVLET_SESSION_COOKIE_NAME}"
fi

if [[ ! -z "${PROJECT_NAME}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dproject.name=${PROJECT_NAME}"
fi

if [[ ! -z "${SESSION_TIMEOUT}" ]]; then
  JAVA_OPT="${JAVA_OPT} -Dserver.servlet.session.timeout=${SESSION_TIMEOUT}"
fi

#===========================================================================================
# Run
#===========================================================================================
JAVA_OPT="${JAVA_OPT} -Dserver.port=8080"
JAVA_OPT="${JAVA_OPT} -Dcsp.sentinel.dashboard.server=localhost:8080"
JAVA_OPT="${JAVA_OPT} -jar ${BASE_DIR}/sentinel-dashboard-${SENTINEL_VERSION}.jar"

echo "Sentinel Dashboard is starting, you can docker logs your container"
echo "JAVA_OPT:${JAVA_OPT}"
exec $JAVA ${JAVA_OPT}
