FROM microsoft/powershell:nanoserver

WORKDIR app
COPY check.ps1 .

CMD [ "pwsh", "check.ps1" ]