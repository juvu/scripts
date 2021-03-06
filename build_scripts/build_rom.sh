#!/bin/bash
# simple build sh ... alias br='/home/user/source_folder/device/motorola/quark/rootdir/etc/sbin/build.sh'

#timer counter
START=$(date +%s.%N);
START2="$(date)";
echo -e "\n build start $(date)\n";

#source tree folder yours machine source folder
#main source foludes
FOLDER=/home/bhb27/android/om;
#other source folder on the same machine, because of cacche gcc tool is connected
FOLDER2=/home/bhb27/android/m;

#cd $FOLDER
#. build/envsetup.sh
#make clean

cd $FOLDER2
. build/envsetup.sh 
make clean
lunch cm_quark-userdebug
time mka bacon -j4 2>&1 | tee quark.txt

# final time display *cosmetic...
END2="$(date)";
END=$(date +%s.%N);
echo -e "\nBuild start $START2";
echo -e "Build end   $END2 \n";
echo -e "\n${bldgrn}Total time elapsed: ${txtrst}${grn}$(echo "($END - $START) / 60"|bc ):$(echo "(($END - $START) - (($END - $START) / 60) * 60)"|bc ) (minutes:seconds). ${txtrst}\n";

