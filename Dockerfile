FROM mcr.microsoft.com/dotnet/core/aspnet:5.0
COPY ["./build", "."]
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
