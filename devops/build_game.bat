@echo off
setlocal

set UE_PROJECT_NAME=VR_Start_Project
set UAT_PATH=d:\UE\UE_5.7\Engine\Build\BatchFiles\RunUAT.bat
set BUILD_DIR=d:\UE_Projects\VR_Start_Project\
set PLATFORM=Win64
set BUILD_NUMBER=1

"%UAT_PATH%" BuildCookRun ^
    -project="%BUILD_DIR%\%UE_PROJECT_NAME%.uproject" ^
    -platform=%PLATFORM% ^
    -clientconfig=Shipping ^
    -build -cook -pak -stage -package -archive -prereqs -map=Game_Map ^
    -archivedirectory="%BUILD_DIR%\Build\%BUILD_NUMBER%"

if %errorlevel% equ 0 (
    echo Build successful!
) else (
    echo Build failed!
    exit /b %errorlevel%
)