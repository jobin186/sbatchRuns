#!/bin/bash
#SBATCH -A research
#SBATCH -c 6
#SBATCH -n 6
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=6096
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=END
#                  ###dd#SBATCH -o rvl.log
echo 'now I am in '
echo ${SLURM_NODELIST}
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
mkdir -p /ssd_scratch/cvit/jobinkv
cd /ssd_scratch/cvit/jobinkv 
#rm -r *

#file="./rvl-cdip.tar.gz"
#if [ ! -f "$file" ]
#then
#    echo "$0: File '${file}' not found."
rsync -avz jobinkv@10.2.16.195:/home/jobinkv/Documents/pdfFig2/subImg /ssd_scratch/cvit/jobinkv/
cd /ssd_scratch/cvit/jobinkv/subImg
rm *.txt
#tar -xvf $file
echo "the copying and extractions are done!"	
#else
#echo "Congratz The file exixts"
#fi
#cp -r ./labels /home/jobinkv/rvl_imageClassification/
echo "$(ls)"
echo "$(pwd)"
#echo "$(ls ./labels/)"
#echo "$(du -sh ./rvl-cdip.tar.gz)"
echo 'all is well'
module add cuda/8.0
module add cudnn/7-cuda-8.0
module add matlab/R2017b
cd /home/jobinkv/similarityMarixCreator/
matlab -nodesktop -nosplash -singleCompThread -r "trainAnnotv1"
#matlab -nodesktop -nosplash -singleCompThread -r "forTraining"
