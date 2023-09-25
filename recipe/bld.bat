if "%ARCH%"=="32" (
   set MACHINE="IX86"
   :: A different SDK is needed when build with VS 2017 and 2015
   :: http://wiki.tcl.tk/54819
   if "%VS_MAJOR%"=="14" (
    echo "Switching SDK versions"
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x86 10.0.15063.0
   )
) else (
  set MACHINE="AMD64"
  :: A different SDK is needed when build with VS 2017 and 2015
  :: http://wiki.tcl.tk/54819
  if "%VS_MAJOR%"=="14" (
    echo "Switching SDK versions"
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" x64 10.0.15063.0
  )
)

pushd win
nmake nmakehlp.exe
nmake -f makefile.vc DESTDIR=%LIBRARY_PREFIX% MACHINE=%MACHINE% release
nmake -f makefile.vc INSTALLDIR=%LIBRARY_PREFIX% MACHINE=%MACHINE% install
if %ERRORLEVEL% GTR 0 exit 1
popd

