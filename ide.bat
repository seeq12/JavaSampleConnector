@echo off

if defined SEEQ_CONNECTOR_SDK_HOME goto :InDevEnvironment

echo.
echo You're not in the Connector SDK Dev Environment.
echo Execute 'environment' first.
echo.
exit /b 1
goto :EOF

:InDevEnvironment

if exist "%SEEQ_CONNECTOR_SDK_HOME%\seeq-link-sdk-debugging-agent\.project" goto :Built

echo.
echo You must build the projects successfully before launching Eclipse.
echo Execute 'build' first.
echo.
exit /b 1
goto :EOF

:Built

set ECLIPSE_SETTINGS_DIR__MAVEN=%SEEQ_CONNECTOR_SDK_HOME%\workspace\.metadata\.plugins\org.eclipse.core.runtime\.settings
if not exist "%ECLIPSE_SETTINGS_DIR__MAVEN%" md "%ECLIPSE_SETTINGS_DIR__MAVEN%"

set SEEQ_CONNECTOR_SDK_HOME__ESCAPED_FOR_ECLIPSE=%SEEQ_CONNECTOR_SDK_HOME:\=\\%
set SEEQ_CONNECTOR_SDK_HOME__ESCAPED_FOR_ECLIPSE=%SEEQ_CONNECTOR_SDK_HOME__ESCAPED_FOR_ECLIPSE::=\:%

echo eclipse.m2.userSettingsFile=%SEEQ_CONNECTOR_SDK_HOME__ESCAPED_FOR_ECLIPSE%\\maven-settings.xml >"%ECLIPSE_SETTINGS_DIR__MAVEN%\org.eclipse.m2e.core.prefs"

start cmd /c ""%SEEQ_CONNECTOR_SDK_HOME%\eclipse\eclipse.exe" -data "%SEEQ_CONNECTOR_SDK_HOME%\workspace" -import "%SEEQ_CONNECTOR_SDK_HOME%""
