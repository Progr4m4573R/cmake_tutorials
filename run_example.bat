@echo off 
REM Output some info to terminal
REM source: https://stackoverflow.com/questions/26551/how-can-i-pass-arguments-to-a-batch-file
echo Simplifying cmake execution
echo How to use: ./run_example.bat "example to run" "number"  (i.e. ./runexample.bat step1 144)
set arg1=%1
set arg2=%2
REM go into the chosen example directory
cd %arg1%
REM configure cmake project run
cmake .
REM build the project
cmake --build .
cd Debug
tutorial %arg2%

REM Now clear all unnecessary files source: https://stackoverflow.com/questions/13139719/delete-all-files-of-specific-type-extension-recursively-down-a-directory-using
cd ..
del /S *.vcxproj
del /S *.vcxproj.filters 
del /S *.sln
del TutorialConfig.h
del CMakeCache.txt
del cmake_install.cmake
REM delete folders without prompt source: https://superuser.com/questions/179660/how-to-recursively-delete-directory-from-command-line-in-windows
rmdir CMakeFiles Debug Tutorial.dir x64 /s /q
REM also clear sub directory if it exists source: https://stackoverflow.com/questions/21033801/checking-if-a-folder-exists-using-a-bat-file
if exist MathFunctions\ (
cd MathFunctions
rmdir CMakeFiles Debug MathFunctions.dir SqrtLibrary.dir /s /q
del cmake_install.cmake
) else (
    echo no sub folder to delete
)

