// Fill out your copyright notice in the Description page of Project Settings.


#include "SampleGRPCCommand.h"

THIRD_PARTY_INCLUDES_START
#include <grpcpp/grpcpp.h>
#include "gRPCGenSource/helloworld.grpc.pb.h"
THIRD_PARTY_INCLUDES_END

void FSampleGRPCCommand::SayHello()
{
	using grpc::Channel;
	using grpc::ClientContext;
	using grpc::Status;
	using helloworld::Greeter;
	using helloworld::HelloReply;
	using helloworld::HelloRequest;

	// サンプルのpython起動のgRPCサーバのポート番号が50051となっている
	const std::shared_ptr<Channel> channel = CreateChannel("localhost:50051", grpc::InsecureChannelCredentials());
	std::unique_ptr<Greeter::Stub> stub(Greeter::NewStub(channel));

	HelloRequest request;
	request.set_name("gRPC Example Project");

	HelloReply reply;
	ClientContext context;
	const Status status = stub->SayHello(&context, request, &reply);


	FString result;
	if (status.ok())
	{
		result = reply.message().c_str();
	}
	else
	{
		result = TEXT("RPC failed");
	}


	GEngine->AddOnScreenDebugMessage(0, 5, FColor::Yellow, result);
}
