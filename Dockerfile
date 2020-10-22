FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

RUN dotnet tool install -g JetBrains.ReSharper.GlobalTools
