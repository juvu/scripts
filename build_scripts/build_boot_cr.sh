#!/bin/bash
# simple build sh ... alias br='/home/user/source_folder/device/motorola/quark/rootdir/etc/sbin/build.sh'

#timer counter
FOLDER2=/home/bhb27/android/crn;
cd $FOLDER2

START=$(date +%s.%N);
START2="$(date)";
echo -e "\n build start $(date)\n";

#cd $FOLDER
#. build/envsetup.sh
#make clean

export RR_BUILDTYPE="Mod"
export askvariant=2
export days_to_log=0
export WITH_SU=true
. build/envsetup.sh
make clean
lunch lineage_quark-userdebug
time mka bootimage -j8 2>&1 | tee quark.txt

# final time display *cosmetic...
END2="$(date)";
END=$(date +%s.%N);
echo -e "\nBuild start $START2";
echo -e "Build end   $END2 \n";
echo -e "\nTotal time elapsed: $(echo "($END - $START) / 60"|bc ):$(echo "(($END - $START) - (($END - $START) / 60) * 60)"|bc ) (minutes:seconds).\n";

exit
