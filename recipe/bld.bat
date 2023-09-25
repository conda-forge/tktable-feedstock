@echo on

setlocal enabledelayedexpansion

set "search=@LIBRARY_PREFIX@"
set "replacement=%LIBRARY_PREFIX%"

for /f "delims=" %%i in ('type "%RECIPE_DIR%\tkConfig.sh"') do (
    set "line=%%i"
    echo !line:%search%=%replacement%!
) > "%LIBRARY_PREFIX%\lib\tkConfig.sh"

type "%LIBRARY_PREFIX%\lib\tkConfig.sh"

endlocal

@rem More readable error messages for debugging.
set CPU_COUNT=1

call %BUILD_PREFIX%\Library\bin\run_autotools_clang_conda_build.bat
if %ERRORLEVEL% neq 0 exit 1
