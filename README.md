# gRPCForUE4ExampleProject
Example of using [gRPCForUE plugin](https://github.com/y-akahori-ramen/gRPCForUE).

## Requirements
- Windows
- [Visual Stduio](https://visualstudio.microsoft.com/)
- [Git](https://git-scm.com/)
- [CMake](https://cmake.org/download/)
- [nasm](https://www.nasm.us/)
- [python](https://www.python.org/)
- [UnrealEngine](https://www.unrealengine.com/)

## Setup
```
git clone https://github.com/y-akahori-ramen/gRPCForUE4ExampleProject.git
cd gRPCForUE4ExampleProject
set UE_ROOT=Path to your unreal engine root. e.g. C:\Program Files\Epic Games\UE_4.27
set CMAKE_GENERATOR=Set your build system. e.g. Visual Studio 17 2022
set GRPC_BRANCH=gRPC version. e.g. v1.41.1
call ./setup.bat
```
Example
-  [setupExampleVS2022UE427.bat](./setupExampleVS2022UE427.bat) 

## Run example gRPC server

```
runExampleServer.bat
```
## Send request to gRPC server in UnrealEngine 
After run setup.bat, Visual studio solution file generated in ExampleProject folder, build and lanch example project.  
Play in project and execute console command `SayHello`.  
Command implementation at [SampleGRPCCommand.cpp](./ExampleProject/Source/ExampleProject/SampleGRPCCommand.cpp).

![](./docImage/gRPCExampleImage.gif)
