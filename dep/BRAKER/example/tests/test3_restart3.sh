wd=test3_restart3
oldDir=test3

if [ -d $wd ]; then
    rm -r $wd
fi

if [ ! -d $oldDir ] ; then
  echo "ERROR: Directory (with contents) of old BRAKER run $oldDir does not exist, yet. Please run test3.sh before running test3_restart3.sh!"
else
    species=$(cat $oldDir/braker.log | perl -ne 'if(m/AUGUSTUS parameter set with name ([^.]+)\./){print $1;}')
    ( time braker.pl --genome=../genome.fa --hints=$oldDir/hintsfile.gff --skipAllTraining --species=$species --etpmode --softmasking --workingdir=$wd --cores 8 ) &> test3_restart3.log
fi
