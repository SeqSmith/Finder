wd=test1_restart3
oldDir=test1

if [ -d $wd ]; then
    rm -r $wd
fi

if [ ! -d $oldDir ] ; then
  echo "ERROR: Directory (with contents) of old BRAKER run $oldDir does not exist, yet. Please run test1.sh before running test1_restart3.sh!"
else
    species=$(cat $oldDir/braker.log | perl -ne 'if(m/AUGUSTUS parameter set with name ([^.]+)\./){print $1;}')
    ( time braker.pl --genome=../genome.fa --hints=$oldDir/hintsfile.gff --skipAllTraining --species=${species} --softmasking --workingdir=$wd --cores 8 ) &> test1_restart3.log
fi
