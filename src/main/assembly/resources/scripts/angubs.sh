#!/usr/bin/env bash

PROJ_NAME=${project.artifactId}-${project.version}
JAR_FILE=${PROJ_NAME}.jar

cygwin=false;
darwin=false;
mingw=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true;;
  Darwin*) darwin=true;;
esac

APP_BIN_HOME=$(dirname "$(realpath "$0")")
APP_HOME=$(realpath "${APP_BIN_HOME}/..")
APP_CONFIG_HOME="${APP_HOME}/config"
APP_LIB_HOME="${APP_HOME}/lib"
APP_LOG_HOME="${APP_HOME}/logs"

if [ -z "$CLASSPATH" ] ; then
  export CLASSPATH="$APP_HOME:$APP_CONFIG_HOME:$APP_LIB_HOME/*"
else
  export CLASSPATH="$CLASSPATH:$APP_HOME:$APP_CONFIG_HOME:$APP_LIB_HOME/*"
fi

if $cygwin ; then
  [ -n "$APP_BIN_HOME" ] &&
    APP_BIN_HOME=`cygpath --unix "$APP_BIN_HOME"`
  [ -n "$APP_HOME" ] &&
    APP_HOME=`cygpath --unix "$APP_HOME"`
  [ -n "$APP_CONFIG_HOME" ] &&
    APP_CONFIG_HOME=`cygpath --path --unix "$APP_CONFIG_HOME"`
  [ -n "$APP_LIB_HOME" ] &&
    APP_LIB_HOME=`cygpath --path --unix "$APP_LIB_HOME"`
  [ -n "$APP_LOG_HOME" ] &&
    APP_LOG_HOME=`cygpath --path --unix "$APP_LOG_HOME"`
  [ -n "$CLASSPATH" ] &&
    CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# Change console logger level:
# -DLOG_CONSOLE_THRESHOLD=ERROR

# Change file logger level:
# -DLOG_CONSOLE_THRESHOLD=ERROR

# Change root logger level:
# -DLOG_LEVEL=DEBUG

# Change custom logger level:
# -Dlogging.level.com.angu.*=INFO

# Load spring application.properties from custom path:
# -Dspring.config.location="${APP_CONFIG_HOME}/application.properties"

# Load logback configuration from custom path:
# -Dlogging.config="${APP_CONFIG_HOME}/logback-spring.xml"

exec java \
-Dspring.config.location="${APP_CONFIG_HOME}/application.properties" \
-Dlogging.config="${APP_CONFIG_HOME}/logback-spring.xml" \
-Dlogging.file.name="${APP_LOG_HOME}/${PROJ_NAME}.log" \
-classpath "${CLASSPATH}" \
-jar "${APP_LIB_HOME}/${JAR_FILE}" ${1+"$@"}
