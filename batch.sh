#!/bin/bash
#SBATCH -t 0-10:00       # Runtime - asking for 10 hours
#SBATCH -p short            # Partition (queue) - asking for short queue
#SBATCH -J sra_download             # Job name
#SBATCH -o run.o             # Standard out
#SBATCH -e run.e             # Standard error
#SBATCH -c 1    
#SBATCH --mem 8G   

#module load sra-toolkit/2.9.2-centos_linux64


# for every SRR in the list of SRRs file
for srr in $(cat acc.txt)
do
# call the bash script that does the fastq dump, passing it the SRR number next in file
cat << EOT >> batch/down$srr.sh
#!/bin/bash
module load sra-toolkit/2.9.2-centos_linux64
vdb-config -s "/repository/user/main/public/root=$PWD/temp"
sh $PWD/inner_script.sh $srr
sleep 30
cp $PWD/down$srr.sh* $PWD/err/
rm $PWD/down$srr.sh*
EOT
#qsub $(sh inner_script.sh $srr)
done
