@echo off

if "%1" equ "--seeqBuild" goto :skipEnv

echo Adding Java Development Kit (JDK) to path
call "%~dp0.\jdk\environment.bat"

echo Adding Maven to path
call "%~dp0.\maven\environment.bat"

:skipEnv

set M2_REPO=%~dp0.m2\repository
echo Maven repository will be "%M2_REPO%"

set SEEQ_CONNECTOR_SDK_HOME=%~dp0.

for /f "tokens=*" %%a IN ('dir /b *seeq-link-connector*') DO set SEEQ_CONNECTOR_NAME=%%a

echo ^<settings^>^<localRepository^>%SEEQ_CONNECTOR_SDK_HOME%\.m2\repository^</localRepository^>^</settings^> >"%SEEQ_CONNECTOR_SDK_HOME%\maven-settings.xml"

title Seeq Connector SDK Java Dev Environment

echo.
echo Seeq Connector SDK Java development environment is set up.
echo.
echo Your connector name is currently "%SEEQ_CONNECTOR_NAME%"
echo.
echo First, execute "build" to compile the connector.
echo Then execute "ide" to launch Eclipse for development and debugging.
echo Finally, execute "package" to build a deployable connector package.
echo.
