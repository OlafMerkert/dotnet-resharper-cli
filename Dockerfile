FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine

# Install .NET Core 3.1
RUN dotnet_version=3.1.9 \
        && wget -O dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Runtime/$dotnet_version/dotnet-runtime-$dotnet_version-linux-musl-x64.tar.gz \
        && dotnet_sha512='98778ec5ead5008b018e03defbe6eafe5d7a61e81689ae072dfff2135698e4bf4053d72a81851a25129d5969e3dca1258360961318db44adc3c94a7fd5cd2892' \
        && echo "$dotnet_sha512  dotnet.tar.gz" | sha512sum -c - \
        && mkdir -p /usr/share/dotnet3 \
        && tar -C /usr/share/dotnet3 -oxzf dotnet.tar.gz \
        && rm dotnet.tar.gz

RUN dotnet_version=3.1.9 \
        && ln -s /usr/share/dotnet3/shared/Microsoft.NETCore.App/$dotnet_version /usr/share/dotnet/shared/Microsoft.NETCore.App/$dotnet_version

ENV PATH="${PATH}:/root/.dotnet/tools"
RUN dotnet tool install -g JetBrains.ReSharper.GlobalTools
