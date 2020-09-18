#this is the Anacapa run script for CRUX database alignment used for both PITS and FITS

BASEDIR="#base directory folder for singularity container to run through"
OUT="#output folder locaiton (same as QC script)"
OUTLOG="#log file location"

####
SINGULARITY=$(which singularity)
CONTAINER="#singularity file location/anacapa-1.5.0.img"
DB="#Anacapa database location/Anacapa_db"

cd $BASEDIR
time singularity exec -B $BASEDIR -B $SINGULARITY $CONTAINER /bin/bash -c "$DB/anacapa_classifier.sh -o $OUT -d $DB -l > $OUTLOG"
