$OutputEncoding = [System.Text.Encoding]::GetEncoding('shift_jis')
if(Test-Path Variable:env:publishedfileid){
    $publishedfileid=$env:publishedfileid
}else{
    $publishedfileid=$env:APPVEYOR_BUILD_NUMBER
}
if(Test-Path Variable:env:changenote){
    $changenote=$env:changenote
}else{
    $changenote=($env:APPVEYOR_REPO_COMMIT_MESSAGE).Replace("[release]","")
}
Write-Host "publishedfileid:$publishedfileid"
Write-Host "changenote:$changenote"
$content = $(Get-Content -Encoding UTF8 ".\workshop\scripts\workshop_item.vdf.template" ).Replace("<publishedfileid>",$publishedfileid).Replace("<changenote>",$changenote) 
#$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
$scriptDir=Split-Path $myInvocation.MyCommand.Path -Parent
$path=[IO.Path]::Combine($scriptDir,".\workshop_item.vdf")
Write-Host "path:$path"

[IO.File]::WriteAllLines($path, $content)

Write-Host "content:\n$content"

.\workshop\bin\steamcmd.exe +login $env:steam_user $env:steam_password +workshop_build_item $path +quit
