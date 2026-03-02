@echo off
for /F "tokens=*" %%I in (Comfig.ini) do set %%I
cls
IF NOT EXIST "..\..\..\tf_win64.exe" (goto :Err01) else (goto :fastcheck)

:Err01
color c
echo Error: err01 (Folder is not in CUSTOM folder) 
echo Please put folder in custom folder and open it again.
pause
exit

:Err02
color c
echo Error: err02 (AutoVaule error)
echo Please check Automation vaule and open program again
pause
exit



:fastcheck
if "%AutoVaule%"=="1" goto :rem
if "%AutoVaule%"=="2" goto :modfix
if "%AutoVaule%"=="0" goto :choice
goto :Err02

:choice
set /P c=Choose an Action [1- cache remover 2 - mod limit fixer]
if /I %c% EQU 1 goto :rem
if /I %c% EQU 2 goto :modfix

:rem
echo Removing cache files...
del /F /S *.cache
goto :end

:modfix
IF NOT EXIST "%foldername%/resource" (goto :makefolder) else (goto :Copy)

:makefolder
mkdir "%foldername%/resource"
goto :Copy

:Copy
color f
echo Copying resource files to %foldername%.
%systemroot%\System32\xcopy /Y "..\resource\*_%language%.txt" "%foldername%\resource"
for %%h in (gameui,replay,valve,youtube) do %systemroot%\System32\xcopy /Y "..\..\hl2\resource\%%h_%language%.txt" "%foldername%\resource"
goto :end

:end
color a 
echo Finished!
echo orginal code by panicq and HammerHead133
echo edited by kapi6921 with polish super glue
pause
exit