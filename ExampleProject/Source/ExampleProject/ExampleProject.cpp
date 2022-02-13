// Copyright Epic Games, Inc. All Rights Reserved.

#include "ExampleProject.h"
#include "Modules/ModuleManager.h"
#include "SampleGRPCCommand.h"

class FExampleProjectModule final : public FDefaultGameModuleImpl
{
public:
	virtual void StartupModule() override;
};

void FExampleProjectModule::StartupModule()
{
	if (!IsRunningCommandlet())
	{
		// SayHelloコンソールコマンドでgRPCのサンプル処理を呼び出せるようにする
		IConsoleManager::Get().RegisterConsoleCommand(
			TEXT("SayHello"),
			TEXT("SayHello"),
			FConsoleCommandWithArgsDelegate::CreateLambda([](const TArray<FString>& Args)
			{
				FSampleGRPCCommand::SayHello();
			}),
			ECVF_Default
		);
	}
}


IMPLEMENT_PRIMARY_GAME_MODULE(FExampleProjectModule, ExampleProject, "ExampleProject");
