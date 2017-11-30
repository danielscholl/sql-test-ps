FROM microsoft/powershell:ubuntu16.04

WORKDIR app
COPY check.ps1 .

CMD [ "pwsh", "check.ps1" ]