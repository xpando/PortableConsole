@echo off
..\bin\wget.exe -v -O "console2.zip" "http://downloads.sourceforge.net/project/console/console-devel/2.00/Console-2.00b148-Beta_32bit.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fconsole%2Ffiles%2Fconsole-devel%2F2.00%2F&ts=1333737039&use_mirror=voxel"
if exist ..\bin\Console2 rd /S /Q ..\bin\Console2
..\bin\7za.exe x -o"..\bin" console2.zip
del console2.zip
pause