FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /source
COPY . .
RUN ls
RUN dotnet restore "./samplewebapp/app/SampleWebApp/SampleWebApp.csproj" 
RUN dotnet publish "./samplewebapp/app/SampleWebApp/SampleWebApp.csproj" -o /app --no-restore

FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
