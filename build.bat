setlocal
pushd %~dp0

@rem Set VS variables (uses Visual Studio 2015)
@call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x64
if ERRORLEVEL 1 goto error

cd third_party\protobuf\cmake
cmake -G "Visual Studio 14 2015 Win64" -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -Dprotobuf_BUILD_TESTS=OFF
if ERRORLEVEL 1 goto error

msbuild protobuf.sln /p:Platform=x64 /p:Configuration=Release
if ERRORLEVEL 1 goto error

cd ../../../vsprojects
msbuild grpc.sln /p:Platform=x64 /p:Configuration=Release
if ERRORLEVEL 1 goto error

msbuild grpc_protoc_plugins.sln /p:Platform=x64 /p:Configuration=Release
if ERRORLEVEL 1 goto error

rem Done
goto :EOF

rem Error happened. Wait for a keypress before quitting.
:error
pause
