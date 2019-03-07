[![Build status](https://ci.appveyor.com/api/projects/status/ae8dy648sar8hknr?svg=true&branch=master)](https://ci.appveyor.com/project/tignear/dawn-of-man-ja?branch=master)

# Dawn Of Manの日本語訳

煮るなり焼くなり好きにしてください。

## SteamWorkShop
[SteamWorkShopのページ](https://steamcommunity.com/sharedfiles/filedetails/?id=1673010962)

## ダウンロードして使う
右上のClone Or downloadからDownload zipを押してダウンロード。  
そして展開。その後Stringsフォルダの中身を\Documents\DawnOfMan\Stringsにコピー。
```
tree %USERPROFILE%\DOCUMENTS\DAWNOFMAN\STRINGS
フォルダー パスの一覧:  ボリューム Windows
ボリューム シリアル番号は 2228-C80B です
C:\USERS\%USERNAME%\DOCUMENTS\DAWNOFMAN\STRINGS
    ja_achievements.lng.xml
    ja_entity_types.lng.xml
    ja_help.lng.xml
    ja_main.lng.xml
    ja_presence.lng.xml
    ja_scenarios.lng.xml
    ja_scenario_ancient_warriors.lng.xml
    ja_scenario_before_dawn.lng.xml
    ja_scenario_continental_dawn.lng.xml
    ja_scenario_metal_age_creative_mode.lng.xml
    ja_scenario_stone_age_creative_mode.lng.xml
    ja_scenario_temple_of_the_sun.lng.xml
    ja_scenario_the_long_march.lng.xml
    ja_scenario_the_northlands.lng.xml
    ja_scenario_the_shepherds.lng.xml
    ja_tutorial.lng.xml
    
サブフォルダーは存在しません 
```
## 編集する人向け
```
git clone https://github.com/tignear/dawn-of-man-ja.git <dir>
mklink /D <dir>\Strings %USERPROFILE%\Documents\DawnOfMan\Strings
```

