#!/bin/bash
#SBATCH -t 0-10:00       # Runtime - asking for 10 hours
#SBATCH -p short            # Partition (queue) - asking for short queue
#SBATCH -J sra_download             # Job name
#SBATCH -o run.o             # Standard out
#SBATCH -e run.e             # Standard error
#SBATCH -c 1   
#SBATCH --mem 8G     # Memory needed per core

module load sra-toolkit/2.9.2-centos_linux64
# for single end reads only
#prefetch -O /hpcdata/bcbb/yunhua/F21/Chen/kong/temp -v $1
#fastq-dump $1

# for paired end reads only
fastq-dump --split-3 -O $PWD/temp $1 

#$time fastq-dump --split-3 $1 -t /hpcdata/bcbb/yunhua/F21/Chen/kong/temp -e 4
