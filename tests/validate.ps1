$ErrorActionPreference="Stop"

Write-Host "Starting test"
Install-Module Pscx  -Scope CurrentUser -Force -AllowClobber


$scriptDir=Split-Path $myInvocation.MyCommand.Path -Parent 
$xmlPaths=[string[]](Join-Path $scriptDir "..\Strings\*.lng.xml" -Resolve)
$xsd=Join-Path $scriptDir "lng.xsd"
$ret=$True
Test-Xml -Path $xmlPaths -SchemaPath $xsd | ForEach-Object{$ret = $ret -And $_}
if(!($ret)){
    exit 1#fail
}
Write-Host "Test OK"
