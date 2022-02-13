@echo off

echo "Run example gRPC server"

pushd %~dp0\pythonEnv
setlocal
set PYTHON_EXE=.\.venv\Scripts\python.exe
%PYTHON_EXE% greeter_server.py
endlocal
popd
