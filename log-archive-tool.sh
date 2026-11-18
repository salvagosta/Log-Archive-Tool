# Log-archive-tool from roadmap.sh
#
# The tool should:
# 1) run from the command line;
# 2) accept the log directory as an argument;
# 3) compress the logs;
# 4) and store them in a new directory;
#
# The user should be able to:
# A) Provide the log directory as an argument
#    when running the tool;
# B) The tool should compress the logs in a tar.gz
#    file and store them in a new directory;
# C) The tool should log the date and time of the
#    archive to a file;
#

#!/bin/bash

# Take log directory from user in the CLI  and ask for new directory and name for the tar file
logpath="$1"
read -p "Insert New Directory for the '.tar' file: " tarpath
read -p "Insert the name for the new '.tar' file: " nametar

#Date to put in the file name and directory .txt file
date=$(date '+%Y-%m-%d--%H-%M-%S')

# Compress the logs in a tar.gz file with date and time and move to new directory
for logs in {$logpath/*.log}
   do 
       mkdir -p $tarpath #this create the directory
       cd $logpath #move to directory where logs are
       tar -czvf ${nametar}_${date}.tar.gz *.log #create the tar file with logs
       mv -v ${nametar}_${date}.tar.gz --target-directory=$tarpath #move tar file to other directory
   done
cd $tarpath && echo  "$date" > date_and_time_archive.txt #log of .tar creation

 
#############################################------ABORTED CODE-----########################################################
# if
#    $logpath = 1 #?? non sono sicuro di questo punto
#then
#    echo "ERROR: PATH NOT FOUND"
#    exit
#fi

#if 
#    find $logpath  -iname '*.log' #QUESTO CERCA E STAMPA I LOGFILE, MA NON SIGNIFICA CHE IL PROGRAMMA LEGGA SE CI SONO O MENO
#then
#    mkdir -p $tarpath
#    tar -cvf log_archive.tar $logpath --add-file='*.log' | mv -v log_archive.tar --target-directory=$tarpath    
#else
#    echo "ERROR: There are no logs in this directory."
#    exit
#fi
