@echo off
echo.
echo. deleting ~?~
FOR /F "tokens=*" %%A IN ('DIR /B  /S *.~?~')  do del %%A

