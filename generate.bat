@echo off
REM Generate CMake build files for Lucy's Labyrinth
setlocal

set "ROOT=%~dp0"
set "BUILD=%ROOT%build"

if not exist "%BUILD%" mkdir "%BUILD%"
cd /d "%BUILD%"

cmake -G "Visual Studio 17 2022" -A x64 .. %*

echo.
echo Build files written to: %BUILD%
echo Open Lucys_Labyrinth.sln or run: cmake --build . --config Release
endlocal
