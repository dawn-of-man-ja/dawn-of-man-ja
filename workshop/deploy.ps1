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
$(Get-Content ".\scripts\workshop_item.vdf.template").Replace("<publishedfileid>",$publishedfileid).Replace("<changenote>",$changenote)  > workshop_item.vdf

bin\steamcmd.exe +login $env:steam_user $env:steam_password +workshop_build_item ..\workshop_item.vdf
