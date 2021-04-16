@echo off

if defined SEEQ_CONNECTOR_SDK_HOME goto :InDevEnvironment

echo.
echo You're not in the Connector SDK Dev Environment.
echo Execute 'environment' first.
echo.
exit /b 1
goto :EOF

:InDevEnvironment

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=pom -Dfile=libraries/com/seeq/link/jvm-link/jvm-link-50.4.4-v202103021828.pom -DpomFile=libraries/com/seeq/link/jvm-link/jvm-link-50.4.4-v202103021828.pom
if ERRORLEVEL 1 goto :Error

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=jar -Dfile=libraries/com/seeq/seeq-sdk/seeq-sdk-50.4.4-v202103021828.jar -DpomFile=libraries/com/seeq/seeq-sdk/seeq-sdk-50.4.4-v202103021828.pom -Djavadoc=libraries/com/seeq/seeq-sdk/seeq-sdk-50.4.4-v202103021828-javadoc.jar -Dsources=libraries/com/seeq/seeq-sdk/seeq-sdk-50.4.4-v202103021828-sources.jar
if ERRORLEVEL 1 goto :Error

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=jar -Dfile=libraries/com/seeq/utilities/seeq-utilities/seeq-utilities-50.4.4-v202103021828.jar -DpomFile=libraries/com/seeq/utilities/seeq-utilities/seeq-utilities-50.4.4-v202103021828.pom -Dsources=libraries/com/seeq/utilities/seeq-utilities/seeq-utilities-50.4.4-v202103021828-sources.jar
if ERRORLEVEL 1 goto :Error

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=jar -Dfile=libraries/com/seeq/link/seeq-link-sdk/seeq-link-sdk-50.4.4-v202103021828.jar -DpomFile=libraries/com/seeq/link/seeq-link-sdk/seeq-link-sdk-50.4.4-v202103021828.pom -Djavadoc=libraries/com/seeq/link/seeq-link-sdk/seeq-link-sdk-50.4.4-v202103021828-javadoc.jar -Dsources=libraries/com/seeq/link/seeq-link-sdk/seeq-link-sdk-50.4.4-v202103021828-sources.jar
if ERRORLEVEL 1 goto :Error

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=jar -Dfile=libraries/com/seeq/link/seeq-link-agent/seeq-link-agent-50.4.4-v202103021828.jar -DpomFile=libraries/com/seeq/link/seeq-link-agent/seeq-link-agent-50.4.4-v202103021828.pom
if ERRORLEVEL 1 goto :Error

call mvn install:install-file -s "%~dp0maven-settings.xml" -Dpackaging=jar -Dfile=libraries/com/seeq/shaded/shaded-websocket-client/shaded-websocket-client-9.4.19.v20190610-shade-1.jar -DpomFile=libraries/com/seeq/shaded/shaded-websocket-client/shaded-websocket-client-9.4.19.v20190610-shade-1.pom
if ERRORLEVEL 1 goto :Error

call mvn -f "%SEEQ_CONNECTOR_SDK_HOME%\seeq-link-sdk-debugging-agent\pom.xml" -s "%~dp0maven-settings.xml" install eclipse:eclipse
if ERRORLEVEL 1 goto :Error

call mvn -f "%SEEQ_CONNECTOR_SDK_HOME%\%SEEQ_CONNECTOR_NAME%\pom.xml" -s "%~dp0maven-settings.xml" install eclipse:eclipse
if ERRORLEVEL 1 goto :Error

goto :EOF

:Error
exit /b 1
