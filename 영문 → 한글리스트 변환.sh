sudo rm /opt/retropie/configs/all/attractmode/romlists/kr/*
/opt/retropie/configs/all/attractmode/romlists_kr/krRomList
cp /opt/retropie/configs/all/attractmode/romlists/kr/* /opt/retropie/configs/all/attractmode/romlists/
cd /opt/retropie/configs/all/attractmode/romlists
ls -I"Attract Mode Setup.txt" -I"all.*" -I*.tag -I"kr" -I*.bak | xargs -i cat {} > all.txt
ls -I"Attract Mode Setup.tag" -I"all.*" -I*.txt -I"kr" -I*.bak | xargs -i cat {} > all.tag
#clear