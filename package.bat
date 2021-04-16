@echo off

if defined SEEQ_CONNECTOR_SDK_HOME goto :InDevEnvironment

echo.
echo You're not in the Connector SDK Dev Environment.
echo Execute 'environment' first.
echo.
exit /b 1
goto :EOF

:InDevEnvironment

java -cp %~dp0.\seeq-link-sdk-debugging-agent\target\lib\seeq-link-sdk-50.4.4-v202103021828.jar com.seeq.link.sdk.utilities.ConnectorPackager "%SEEQ_CONNECTOR_NAME%\target" "packages\%SEEQ_CONNECTOR_NAME%"
