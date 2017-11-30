function Test-SQLConnection {    
  [OutputType([bool])]
  Param
  (
    [Parameter(Mandatory = $true,
      ValueFromPipelineByPropertyName = $true,
      Position = 0)]
    $ConnectionString
  )
  try {
    Write-Output $ConnectionString
    $sqlConnection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString;
    $sqlConnection.Open();
    $sqlConnection.Close();

    Write-Output  "Database Connected."
    exit 0;
  }
  catch {
    Write-Output  $_.Exception.Message
    exit 1;
  }
}

Test-SQLConnection $env:CONNECTIONSTRING
