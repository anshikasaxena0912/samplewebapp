FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=Build /publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "samplewebapp.dll"]
