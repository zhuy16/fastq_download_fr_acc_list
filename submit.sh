for i in batch/*.sh 
do qsub -cwd $i
sleep 0.5
done
