# sql-test-ps

A Simple PowerShell Connection Test to ensure connectivity to a Database from a container.

## Windows Container Usage

Run the process directly

```powershell
docker-compose -f windows-compose.yml up -d db
$env:CONNECTIONSTRING="Data Source=$env:computername,9433;Initial Catalog=master;User ID=sa;Password=PasswordAzure@123!"
./check.ps1
```

Build the Image

```
docker-compose -f windows-compose.yml build
```

Execute a Test

```powershell
docker-compose up -f windows-compose.yml up
```

Execute a test against an external Database

```powershell
$DB_HOST="dbserver-XXXXX.database.windows.net"
$DB_NAME="master"
$DB_USER="ServerAdmin"
$DB_PASSWORD="PasswordAzure@123!"

$CONNECTION="Server=tcp:$DB_HOST,1433;Database=$DB_NAME;User ID=$DB_USER;Password=$DB_PASSWORD;Encrypt=true;"
$CONNECTION="Data Source=$DB_HOST,1433;Initial Catalog=$DB_NAME;User ID=$DB_USER;Password=$DB_PASSWORD"
docker run -e CONNECTIONSTRING=$CONNECTION sql-test-ps:windows
```

## Linux Container Usage

Run the process directly

```powershell
docker-compose -f linux-compose.yml up -d db
$env:CONNECTIONSTRING="Data Source=$env:computername,9433;Initial Catalog=master;User ID=sa;Password=PasswordAzure@123!"
./check.ps1
```

Build the Image

```
docker-compose -f linux-compose.yml build
```

Execute a Test

```powershell
docker-compose -f linux-compose.yml up
```

Execute a test against an external Database

```powershell
$DB_HOST="dbserver-XXXXX.database.windows.net"
$DB_NAME="master"
$DB_USER="ServerAdmin"
$DB_PASSWORD="PasswordAzure@123!"

$CONNECTION="Server=tcp:$DB_HOST,1433;Database=$DB_NAME;User ID=$DB_USER;Password=$DB_PASSWORD;Encrypt=true;"
$CONNECTION="Data Source=$DB_HOST,1433;Initial Catalog=$DB_NAME;User ID=$DB_USER;Password=$DB_PASSWORD"
docker run -e CONNECTIONSTRING=$CONNECTION sql-test-ps:linux
```