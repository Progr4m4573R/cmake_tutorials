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

