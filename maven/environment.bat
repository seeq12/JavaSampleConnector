@echo off



set DIR=%~dp0.

set M2_HOME=%DIR%\files

set M2=%M2_HOME%\bin

set M2_REPO=%USERPROFILE%\.m2\repository

path %M2%;%PATH%
