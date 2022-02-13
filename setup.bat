@echo off
pushd %~dp0

setlocal
set GRPC_ROOT=%~dp0\ExampleProject\Plugins\gRPCForUE4\Setup\grpcsrc\grpc
set GRPC_EXAMPLE_PROTO_DIR=%GRPC_ROOT%\examples\protos
set GRPC_EXAMPLE_NAME=helloworld

echo "Setup gRPC Plugin"
setlocal
call .\ExampleProject\Plugins\gRPCForUE4\Setup\setup.bat
endlocal

echo "Generate example proto c++ source"
setlocal
set PROTOC_EXE=%GRPC_ROOT%\.build\third_party\protobuf\Release\protoc.exe
set PROTOC_GRPC_PLUGIN_EXE=%GRPC_ROOT%\.build\Release\grpc_cpp_plugin.exe
set CPP_DST_DIR=.\ExampleProject\Source\ExampleProject\gRPCGenSource

%PROTOC_EXE% -I %GRPC_EXAMPLE_PROTO_DIR% --cpp_out=%CPP_DST_DIR% %GRPC_EXAMPLE_PROTO_DIR%\%GRPC_EXAMPLE_NAME%.proto
%PROTOC_EXE% -I %GRPC_EXAMPLE_PROTO_DIR% --grpc_out=%CPP_DST_DIR% --plugin=protoc-gen-grpc=%PROTOC_GRPC_PLUGIN_EXE% %GRPC_EXAMPLE_PROTO_DIR%\%GRPC_EXAMPLE_NAME%.proto
endlocal

echo "Generate VisualStudio solution file"
setlocal
set UNREAL_BUILD_TOOL_EXE="%UE_ROOT%\Engine\Binaries\DotNET\UnrealBuildTool.exe"
set UNREAL_PROJECT_FILE= %~dp0\ExampleProject\ExampleProject.uproject
%UNREAL_BUILD_TOOL_EXE%  -projectfiles -project="%UNREAL_PROJECT_FILE%" -game
endlocal

echo "Setup Python environment"
setlocal
cd %~dp0\pythonEnv
set GRPC_EXAMPLE_PYTHON_DIR=%GRPC_ROOT%\examples\python
python -m venv .venv

set PYTHON_EXE=.\.venv\Scripts\python.exe
%PYTHON_EXE% -m pip install --upgrade pip
%PYTHON_EXE% -m pip install grpcio 
%PYTHON_EXE% -m pip install grpcio-tools
robocopy %GRPC_EXAMPLE_PYTHON_DIR%\%GRPC_EXAMPLE_NAME% .
endlocal

endlocal
popd
