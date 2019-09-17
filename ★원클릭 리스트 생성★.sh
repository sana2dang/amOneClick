#!/usr/bin/env bash

sudo killall attract

cp -rf /opt/retropie/configs/all/attractmode/default_cfg /opt/retropie/configs/all/attractmode/attract_new.cfg

cd /opt/retropie/configs/all/attractmode/emulators

emulator_list="ls *.cfg"
for eachfile in $emulator_list 
do
	emulator=$( echo $eachfile | sed "s/.cfg//g")

	if [ "$emulator" != "Attract Mode Setup" -a "$emulator" != "Favorites.txt" -a "$emulator" != "RetroPie" ];then
		echo $emulator
		rm -rf /opt/retropie/configs/all/attractmode/romlists/"$emulator".txt
		attract --build-romlist "$emulator" --output "$emulator"

		if [ -f /opt/retropie/configs/all/attractmode/romlists/"$emulator".txt ]; then
			sed 's/AAAAAAAAAA/'"$emulator"'/g' /opt/retropie/configs/all/attractmode/default_display >> /opt/retropie/configs/all/attractmode/attract_new.cfg
		fi
	fi
done

cat /opt/retropie/configs/all/attractmode/default_input >> /opt/retropie/configs/all/attractmode/attract_new.cfg

cp -rf /opt/retropie/configs/all/attractmode/attract.cfg /opt/retropie/configs/all/attractmode/attract.cfg.backup
cp -rf /opt/retropie/configs/all/attractmode/attract_new.cfg /opt/retropie/configs/all/attractmode/attract.cfg
sudo rm -rf /opt/retropie/configs/all/attractmode/attract_new.cfg

bash "/opt/retropie/configs/all/attractmode/Attract Mode Setup/영문 → 한글리스트 변환.sh"
bash "/opt/retropie/configs/all/attractmode/Attract Mode Setup/즐겨찾기 리스트 만들기.sh"

clear
echo
echo
echo
echo "Please Reboot... shutdown -> power on"
echo
echo
echo
#sudo reboot