FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./SampleWebApp/SampleWebApp.csproj" --disable-parallel
RUN dotnet publish "./SampleWebApp/SampleWebApp.csproj" -o /app --no-restore

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
