#This is the run script for the QC step of Anacapa used by Sabrina Shirazi for examining PCR replicate PITS data

DATA="Raw Data folder Location"
OUT="#output folder locaiton"
OUTLOG="#log file location"
################


SINGULARITY=$(which singularity)
BASEDIR="#base directory folder for singularity container to run through"
CONTAINER="#singularity file location/anacapa-1.5.0.img"
DB="#Anacapa database location/Anacapa_db"
FORWARD="#forward primer file location/forward_primers.txt"
REVERSE="#reverse primer file location/reverse_primers.txt"

cd $BASEDIR


time singularity exec -B $BASEDIR  $CONTAINER /bin/bash -c "$DB/anacapa_QC_dada2.sh -i $DATA -o $OUT -d $DB -f $FORWARD -r $REVERSE -e $DB/metabarcode_loci_min_merge_length.txt -a truseq -t MiSeq  -x 5 -y 5 -l > $OUTLOG"
