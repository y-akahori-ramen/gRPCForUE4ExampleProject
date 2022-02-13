# gRPCForUE4ExampleProject
gRPCForUE4リポジトリを利用してUE4のプロジェクトでgRPCを使用する例

## 概要
UnrealEngine4でgRPCを利用するためのプラグイン[gRPCForUE4](https://github.com/y-akahori-ramen/gRPCForUE4)を実際のUnrealEngineのプロジェクトで使用する例  

## 必要環境
Windowsのみ対応。

さらに以下が使える状態であること。
- [Visual Stduio](https://visualstudio.microsoft.com/)
- [Git](https://git-scm.com/)
- [CMake](https://cmake.org/download/)
- [nasm](https://www.nasm.us/)
- [python](https://www.python.org/)
- [UnrealEngine](https://www.unrealengine.com/)

## 環境準備

### コード取得
```
git clone https://github.com/y-akahori-ramen/gRPCForUE4ExampleProject.git
cd gRPCForUE4ExampleProject
git submodule update --init
```

### setup.bat実行
環境構築をするためにUEのルートディレクトリとCMakeで使用するジェネレーターを環境変数に設定して[setup.bat](./setup.bat)を呼び出す。
UE4.27とVS2022で実行する例として [setupExampleVS2022UE427.bat](./setupExampleVS2022UE427.bat) がある。

## 実行
サンプル用のgRPCサーバーを以下のコマンドで実行する
```
runExampleServer.bat
```

ExampleProjectフォルダ内にVisualStudioのソリューションファイルが生成されるため開いて実行する。  
UnrealEngineでPlayInを行い、コンソールコマンド"SayHello"を実行する。  
※SayHelloコンソールコマンドは前述の操作で立てたサーバに通信を行いレスポンス結果を画面上に出力する内容となっている。

![](./docImage/gRPCExampleImage.gif)
