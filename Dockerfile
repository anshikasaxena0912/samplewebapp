FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./app/samplewebapp/SampleWebApp.csproj" 
RUN dotnet publish "./app/samplewebapp/SampleWebApp.csproj" -o /app --no-restore

FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
