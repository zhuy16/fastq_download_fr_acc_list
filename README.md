This is for paired end reads only. for single end, need to modify the inner_sra.sh file.

clean the folder
rm -rf batch/* err/* temp/* down*
and copy the whole parent folder for another study.

1. replace the specific acc.txt file to that folder.
3. sh batch.sh to generate batch files. 
4. sh submit.sh to download fastq files to temp folder. 

5. once the download finishes, clean the error files. 
mv down* err/ 
# fastq_download_fr_acc_list