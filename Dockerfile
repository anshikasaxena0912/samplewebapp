FROM mcr.microsoft.com/dotnet/aspnet:3.0-buster-slim AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./SampleWebApp/SampleWebApp.csproj" 
RUN dotnet publish "./SampleWebApp/SampleWebApp.csproj" -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:3.0-buster-slim
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
