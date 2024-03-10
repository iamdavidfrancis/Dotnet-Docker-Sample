FROM mcr.microsoft.com/dotnet/sdk:8.0 as build
WORKDIR /App
COPY . ./
RUN dotnet restore
RUN dotnet publish -c Release -o publish ./DotnetDocker.Console

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /App
COPY --from=build /App/publish .
ENTRYPOINT ["dotnet", "DotnetDocker.Console.dll"]