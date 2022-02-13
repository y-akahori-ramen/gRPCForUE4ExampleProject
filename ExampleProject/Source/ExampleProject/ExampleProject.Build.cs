// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;

public class ExampleProject : ModuleRules
{
	public ExampleProject(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;
	
		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore" });

		PrivateDependencyModuleNames.AddRange(new string[] {  });

		// Use gRPC module
		PublicDependencyModuleNames.Add("gRPCForUE4");
	}
}
