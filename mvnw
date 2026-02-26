#!/bin/sh

set -e

BASE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WRAPPER_DIR="$BASE_DIR/.mvn/wrapper"
WRAPPER_PROPS="$WRAPPER_DIR/maven-wrapper.properties"
WRAPPER_JAR="$WRAPPER_DIR/maven-wrapper.jar"

if [ ! -f "$WRAPPER_PROPS" ]; then
  echo "Could not find $WRAPPER_PROPS" >&2
  exit 1
fi

if [ -z "$JAVA_HOME" ]; then
  JAVA_EXE="$(command -v java || true)"
else
  JAVA_EXE="$JAVA_HOME/bin/java"
fi

if [ ! -x "$JAVA_EXE" ]; then
  echo "Java executable not found. Set JAVA_HOME or install Java." >&2
  exit 1
fi

if [ ! -f "$WRAPPER_JAR" ]; then
  WRAPPER_URL=$(grep '^wrapperUrl=' "$WRAPPER_PROPS" | cut -d'=' -f2-)
  if [ -z "$WRAPPER_URL" ]; then
    echo "wrapperUrl is not set in $WRAPPER_PROPS" >&2
    exit 1
  fi

  mkdir -p "$WRAPPER_DIR"
  echo "Downloading Maven Wrapper from $WRAPPER_URL"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$WRAPPER_URL" -o "$WRAPPER_JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$WRAPPER_URL" -O "$WRAPPER_JAR"
  else
    echo "Neither curl nor wget is available to download Maven Wrapper." >&2
    exit 1
  fi
fi

exec "$JAVA_EXE" \
  -Dmaven.multiModuleProjectDirectory="$BASE_DIR" \
  -classpath "$WRAPPER_JAR" \
  org.apache.maven.wrapper.MavenWrapperMain "$@"

