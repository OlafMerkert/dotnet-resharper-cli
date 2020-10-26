FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine

ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install -g JetBrains.ReSharper.GlobalTools
