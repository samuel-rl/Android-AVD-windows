@echo off

:start
echo                         _                  _       _     ______                       _           _                  
echo     /\                 ^| ^|                (_)     ^| ^|   ^|  ____^|                     ^| ^|         ^| ^|                 
echo    /  \     _ __     __^| ^|  _ __    ___    _    __^| ^|   ^| ^|__     _ __ ___    _   _  ^| ^|   __ _  ^| ^|_    ___    _ __ 
echo   / /\ \   ^| '_ \   / _` ^| ^| '__^|  / _ \  ^| ^|  / _` ^|   ^|  __^|   ^| '_ ` _ \  ^| ^| ^| ^| ^| ^|  / _` ^| ^| __^|  / _ \  ^| '__^|
echo  / ____ \  ^| ^| ^| ^| ^| (_^| ^| ^| ^|    ^| (_) ^| ^| ^| ^| (_^| ^|   ^| ^|____  ^| ^| ^| ^| ^| ^| ^| ^|_^| ^| ^| ^| ^| (_^| ^| ^| ^|_  ^| (_) ^| ^| ^|   
echo /_/    \_\ ^|_^| ^|_^|  \__,_^| ^|_^|     \___/  ^|_^|  \__,_^|   ^|______^| ^|_^| ^|_^| ^|_^|  \__,_^| ^|_^|  \__,_^|  \__^|  \___/  ^|_^|   

:menu                                                                                                                      
echo.
echo.    
echo 0) Exit                                                                                                 
echo 1) Show emulator
echo 2) Start an emulator
echo 3) Create new one
echo.
goto :ask


:ask
set /p reponse="What to do?"
If /i "%reponse%"=="1" goto :res1
If /i "%reponse%"=="2" goto :res2
If /i "%reponse%"=="3" goto :warningError
If /i "%reponse%"=="0" goto :res0

:none
cls
goto :start

:res1
cd C:\Users\%USERNAME%\AppData\Local\Android\Sdk\emulator
cls
:res1AfterCls
call emulator -list-avds
echo.
:launch
set /p input= Which emulator to launch ? 
emulator -avd %input%
echo.
echo.
if errorlevel 1 goto :errorNotExist
goto :fin

:errorNotExist
cls
echo Emulator does not exist...Choose a correct one:
echo.
goto :res1AfterCls

:res2
cd C:\Users\%USERNAME%\AppData\Local\Android\Sdk\emulator
cls
goto :launch

:warningError
cls
echo this may not work depending on your version...
:warningErrorAsk
set /p res="Continue[Y/N]?"
If /i "%res%"=="Y" goto :res3
If /i "%res%"=="y" goto :res3
If /i "%res%"=="N" goto :menu
If /i "%res%"=="n" goto :menu
goto :warningErrorAsk


:res3
cd C:\Users\samue\AppData\Local\Android\Sdk\tools
set /p inputName= Name of emulator ? 
android create avd -n %inputName%
pause

:finish
exit