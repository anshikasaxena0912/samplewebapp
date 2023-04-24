FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY . .
RUN dotnet build -c release
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
