cd /home/pi/.attract/romlists
rm Favorites.tag
rm Favorites.txt
touch /home/pi/.attract/romlists/Favorites.txt

clear
echo
echo "This script will generate a new romlist called Favorites.txt."
echo
echo "Generating new Favorites.txt file ....."
sleep 1
echo

ls *.tag | grep -v all.tag | grep -v 'Attract Mode Setup.tag' > tagfiles

while read filename
do
echo "Using ${filename} ....."
echo

  while read gamename
  do
    romlist=`echo ${filename} |cut -f1 -d '.'`
    echo "     Searching ${romlist}.txt for ${gamename} ....."
    cat "${romlist}.txt"|grep "^${gamename};" >> Favorites.txt
#    cat "${romlist}.txt"|egrep "^${gamename};" >> Favorites.txt
#    cat "${romlist}.txt"|grep "[;]${gamename}[;]" >> Favorites.txt
  done < "${filename}"

sleep 1
echo
done < tagfiles

rm tagfiles

cat Favorites.txt |sort -u > tmp_favorites.txt
mv tmp_favorites.txt Favorites.txt

echo "Finished creating new Favorites.txt ....."
echo
echo

echo "Using this new romlist, create a new Display and choose Favorites as the romlist for it."
echo    
echo "You may need to periodically update the Favorites romlist as you add new favorites."
echo
echo
sleep 1
echo 
