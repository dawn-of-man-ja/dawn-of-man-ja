$ErrorActionPreference="Stop"
$env:LANG = "en_US.UTF-8";
chcp 65001
#APPVEYOR_REPO_COMMITの文字化け対策
#git logもいまいちうまく行かなかった。
$query= "https://api.github.com/repos/$env:APPVEYOR_REPO_NAME/git/commits/$env:APPVEYOR_REPO_COMMIT";
Write-Host "query:$query"
$message=(Invoke-RestMethod -Uri $query -Method GET).message
#[release]がふくまれていてなおかつPRではないときのみdeploy
if((!($message.Contains("[release]"))) -Or (Test-Path Variable:env:APPVEYOR_PULL_REQUEST_NUMBER)){
    Write-Host "This is PR or not contain [release]"
    exit 0
}
Write-Host "Start deploy to steam!"
if(Test-Path Variable:env:changenote){
    $changenote=$env:changenote
}else{
    $changenote=($message).Replace("[release]`r`n","").Replace("[release]","").Replace("`r`n","\n")
}

Write-Host "changenote:$changenote"
$content = $(Get-Content -Encoding UTF8 ".\workshop\scripts\workshop_item.vdf.template" ).Replace("<changenote>",$changenote) 
$scriptDir=Split-Path $myInvocation.MyCommand.Path -Parent 
$path=[IO.Path]::Combine($scriptDir,".\workshop_item.vdf")
Write-Host "path:$path"

    [IO.File]::WriteAllLines($path, $content)

    Write-Host "content:`r`n$content"

.\workshop\bin\steamcmd.exe +login $env:steam_user $env:steam_password +workshop_build_item $path +quit
