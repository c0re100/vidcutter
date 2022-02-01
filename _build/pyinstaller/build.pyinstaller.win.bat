@echo off

REM ......................setup variables......................
if [%1]==[] (
    SET ARCH=64
) else (
    SET ARCH=%1
    echo 32bit is not supported.
    pause
    exit
)

if ["%ARCH%"]==["64"] (
    SET BINARCH=x64
    SET FFMPEG_URL=https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-latest-win64-static.zip
    SET FFMPEG=ffmpeg-latest-win64-static.zip
    SET MEDIAINFO_URL=https://mediaarea.net/download/binary/mediainfo/21.03/MediaInfo_CLI_21.03_Windows_x64.zip
    SET MEDIAINFO=MediaInfo_CLI_21.03_Windows_x64.zip
    SET GIFSKI_URL=https://gif.ski/gifski-1.4.0.zip
    SET GIFSKI=gifski-1.4.0.zip
)
:: if ["%ARCH%"]==["32"] (
::    SET BINARCH=x86
::    SET FFMPEG_URL=https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.zip
::    SET FFMPEG=ffmpeg-latest-win32-static.zip
::    SET MEDIAINFO_URL=https://mediaarea.net/download/binary/mediainfo/18.12/MediaInfo_CLI_18.12_Windows_i386.zip
::    SET MEDIAINFO=MediaInfo_CLI_18.12_Windows_i386.zip
::)

REM ......................get latest version number......................
for /f "delims=" %%a in ('C:\Python36\python.exe version.py') do @set APPVER=%%a

REM ......................cleanup previous build scraps......................
rd /s /q build
rd /s /q dist
if not exist "..\..\bin\" mkdir ..\..\bin\
del /q ..\..\bin\*.*

REM ......................download latest FFmpeg static binary......................
if not exist ".\temp\" mkdir temp
if not exist "temp\%FFMPEG%" ( curl -k -L -fsS -o temp\%FFMPEG% "%FFMPEG_URL%" )
if not exist "temp\%MEDIAINFO%" ( curl -k -L -fsS -o temp\%MEDIAINFO% "%MEDIAINFO_URL%" )
if not exist "temp\%GIFSKI%" ( curl -k -L -fsS -o temp\%GIFSKI% "%GIFSKI_URL%" )

REM ......................extract ffmpeg/mediainfo/gifski to its expected location......................
cd temp\
"C:\Program Files\7-Zip\7z.exe" e %FFMPEG% ffmpeg-latest-win64-static/bin/ffmpeg.exe
"C:\Program Files\7-Zip\7z.exe" e %MEDIAINFO% MediaInfo.exe
"C:\Program Files\7-Zip\7z.exe" e %GIFSKI% win/gifski.exe
if not exist "..\..\..\bin\" mkdir "..\..\..\bin\"
move ffmpeg.exe ..\..\..\bin\
move MediaInfo.exe ..\..\..\bin\
move gifski.exe ..\..\..\bin\
cd ..

REM ......................run pyinstaller......................
C:\Python36\scripts\pyinstaller.exe --clean vidcutter.win%ARCH%.spec

if exist "dist\VidCutter_HuskyVer.exe" (
    REM ......................add metadata to built Windows binary......................
    .\verpatch.exe dist\VidCutter_HuskyVer.exe /va %APPVER%.1 /pv %APPVER%.1 /s desc "VidCutter Husky Version" /s name "VidCutter Husky Version" /s copyright "(c) 2022 Husky" /s product "VidCutter %BINARCH%" /s company "husky.dev"

    cd ..\pyinstaller
)
