FROM microsoft/dotnet:latest AS build
WORKDIR /source
COPY . .
RUN dotnet restore "./SampleWebApp/SampleWebApp.csproj" 
RUN dotnet publish "./SampleWebApp/SampleWebApp.csproj" -o /app --no-restore

FROM microsoft/dotnet:latest
WORKDIR /app
COPY --from=build /app ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
