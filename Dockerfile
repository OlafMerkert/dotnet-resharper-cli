FROM mcr.microsoft.com/dotnet/sdk:5.0

# Install .NET Core 3.1
RUN dotnet_version=3.1.9 \
        && curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Runtime/$dotnet_version/dotnet-runtime-$dotnet_version-linux-x64.tar.gz \
        && dotnet_sha512='dde97e3e95fe4109bcb6a16c23b709e8144a75ec46222e62541bd052c9db734008a8ccf3b2441b9438687bf9d2643f0155e795253c77a7d2eb6030bf1af3bba0' \
        && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
        && mkdir -p /usr/share/dotnet3 \
        && tar -ozxf dotnet.tar.gz -C /usr/share/dotnet3 \
        && rm dotnet.tar.gz

RUN dotnet_version=3.1.9 \
        && ln -s /usr/share/dotnet3/shared/Microsoft.NETCore.App/$dotnet_version /usr/share/dotnet/shared/Microsoft.NETCore.App/$dotnet_version

ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install -g JetBrains.ReSharper.GlobalTools
