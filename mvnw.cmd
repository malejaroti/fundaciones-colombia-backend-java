@ECHO OFF
SETLOCAL

SET BASE_DIR=%~dp0
SET WRAPPER_DIR=%BASE_DIR%\.mvn\wrapper
SET WRAPPER_PROPS=%WRAPPER_DIR%\maven-wrapper.properties
SET WRAPPER_JAR=%WRAPPER_DIR%\maven-wrapper.jar

IF NOT EXIST "%WRAPPER_PROPS%" (
  ECHO Could not find %WRAPPER_PROPS%
  EXIT /B 1
)

IF "%JAVA_HOME%"=="" (
  SET JAVA_EXE=java.exe
) ELSE (
  SET JAVA_EXE=%JAVA_HOME%\bin\java.exe
)

IF NOT EXIST "%WRAPPER_JAR%" (
  FOR /F "tokens=1,* delims==" %%A IN (%WRAPPER_PROPS%) DO (
    IF "%%A"=="wrapperUrl" SET WRAPPER_URL=%%B
  )
  IF "%WRAPPER_URL%"=="" (
    ECHO wrapperUrl is not set in %WRAPPER_PROPS%
    EXIT /B 1
  )

  ECHO Downloading Maven Wrapper from %WRAPPER_URL%
  powershell -NoProfile -ExecutionPolicy Bypass -Command "& { Invoke-WebRequest -Uri '%WRAPPER_URL%' -OutFile '%WRAPPER_JAR%' }"
  IF ERRORLEVEL 1 EXIT /B 1
)

"%JAVA_EXE%" -Dmaven.multiModuleProjectDirectory="%BASE_DIR%" -classpath "%WRAPPER_JAR%" org.apache.maven.wrapper.MavenWrapperMain %*
IF ERRORLEVEL 1 EXIT /B 1

ENDLOCAL

