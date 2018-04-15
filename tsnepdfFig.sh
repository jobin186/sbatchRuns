#!/bin/bash
#SBATCH -A research
#SBATCH -n 1
#SBATCH -c 4
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=6096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
#                  ###dd#SBATCH -o rvl.log
echo 'now I am in '
echo ${SLURM_NODELIST}
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
mkdir -p /ssd_scratch/cvit/jobinkv
rsync -avz jobinkv@ada:/share1/jobinkv/pdfFig2/Img /ssd_scratch/cvit/jobinkv/
#cp -r ./labels /home/jobinkv/rvl_imageClassification/
echo 'all is well'
module add cuda/8.0
module add cudnn/7-cuda-8.0
module add matlab/R2017b
cd /home/jobinkv/pdffigureTsne/
#matlab -nodesktop -nosplash -singleCompThread -r "main_v2('CB55')"
#matlab -nodesktop -nosplash -singleCompThread -r "main_v2"
matlab -nodesktop -nosplash -singleCompThread -r "tsneVisval1"
