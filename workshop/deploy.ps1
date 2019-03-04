$ErrorActionPreference="Stop"
$env:LANG = "en_US.UTF-8";
chcp 65001
if(Test-Path Variable:env:changenote){
    $changenote=$env:changenote
}else{
    #APPVEYOR_REPO_COMMITの文字化け対策
    #git logもいまいちうまく行かなかった。
    $query= "https://api.github.com/repos/$env:APPVEYOR_REPO_NAME/git/commits/$env:APPVEYOR_REPO_COMMIT";
    Write-Host "query:$query"
    $res=Invoke-RestMethod -Uri $query -Method GET
   
    $changenote=$res.message.Replace("[release]","")
}

Write-Host "changenote:$changenote"
$content = $(Get-Content -Encoding UTF8 ".\workshop\scripts\workshop_item.vdf.template" ).Replace("<changenote>",$changenote) 
$scriptDir=Split-Path $myInvocation.MyCommand.Path -Parent 
$path=[IO.Path]::Combine($scriptDir,".\workshop_item.vdf")
Write-Host "path:$path"

    [IO.File]::WriteAllLines($path, $content)

    Write-Host "content:\n$content"

.\workshop\bin\steamcmd.exe +login $env:steam_user $env:steam_password +workshop_build_item $path +quit
