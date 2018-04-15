#!/bin/bash
#SBATCH -A research
#SBATCH -n 4
#SBATCH -c 4
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=6096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
##''-------------------------#SBATCH -o copy.log

#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
module add cuda/8.0
module add cudnn/7-cuda-8.0
module add opencv/3.3.0
echo "I ran on:"
echo $SLURM_NODELIST
mkdir -p /ssd_scratch/cvit/jobinkv/fig-seg_out
rsync -avz jobinkv@ada:/share1/jobinkv/pdfFig2/Img /ssd_scratch/cvit/jobinkv/
#wget http://www.leptonica.org/source/leptonica-1.74.4.tar.gz .
echo 'copying done!'
cd /home/jobinkv/figure-separator
python main.py --images /ssd_scratch/cvit/jobinkv/Img --output /ssd_scratch/cvit/jobinkv/fig-seg_out --annotate 1
rsync -avz /ssd_scratch/cvit/jobinkv/fig-seg_out /home/jobinkv/

