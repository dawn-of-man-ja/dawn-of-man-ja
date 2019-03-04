$ErrorActionPreference="Stop"
#APPVEYOR_REPO_COMMITの文字化け対策
Set-Item env:LANG -Value ja_JP.UTF-8

if(Test-Path Variable:env:changenote){
    $changenote=$env:changenote
}else{
    $changenote=git log --format=%B -n 1
}

Write-Host "changenote:$changenote"
$content = $(Get-Content -Encoding UTF8 ".\workshop\scripts\workshop_item.vdf.template" ).Replace("<changenote>",$changenote) 
#$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
$scriptDir=Split-Path $myInvocation.MyCommand.Path -Parent
$path=[IO.Path]::Combine($scriptDir,".\workshop_item.vdf")
Write-Host "path:$path"

    [IO.File]::WriteAllLines($path, $content)

    Write-Host "content:\n$content"

.\workshop\bin\steamcmd.exe +login $env:steam_user $env:steam_password +workshop_build_item $path +quit
