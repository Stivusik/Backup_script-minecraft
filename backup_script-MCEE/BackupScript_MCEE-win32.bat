@echo off
setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"
set "currentDate=!day!-!month!-!year!_!hour!-!minute!-!second!"
set "source=%USERPROFILE%\AppData\Roaming\Minecraft Education Edition"
set "destination=%~dp0"
set "folderName=Minecraft Education Edition_!currentDate!"
xcopy "%source%" "%destination%!folderName!" /e /i /y /h
if exist "%~dp0\7z.exe" ("%~dp0\7z.exe" a "%destination%!folderName!.7z" "%destination%!folderName!\*")
