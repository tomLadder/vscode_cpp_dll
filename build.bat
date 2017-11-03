@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64    

::/MD => Creates a multithreaded DLL using MSVCRT.lib
::/LD => Creates a dynamic-link library
::/Os => Favors small code
::/O2 => Creates fast code
::/Oi => 	Generates intrinsic functions
::/Gy => Enables function-level linking
set compilerflags=/MD /LD /Os /O2 /Oi /Gy

set outputflags=/Fo.\build\ /Fd.\build\
set linkerflags=/OUT:build/hello.dll -nodefaultlib -subsystem:windows  user32.lib Kernel32.lib
set files=./src/main.cpp
cl.exe %outputflags% %compilerflags% %files% /link %linkerflags% /ENTRY:DllMain