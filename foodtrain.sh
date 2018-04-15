#!/bin/bash
#SBATCH -A research
#SBATCH -c 4
#SBATCH -n 4
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=4096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
##''-------------------------#SBATCH -o copy.log

#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
module load cuda/9.0
module load cudnn/7-cuda-9.0

echo "I ran on:"
echo $SLURM_NODELIST
mkdir -p /ssd_scratch/cvit/jobinkv
rsync -avz jobinkv@10.2.16.195:/mnt/1/food-101.tar.gz /ssd_scratch/cvit/jobinkv/
rsync -avz jobinkv@10.2.16.195:/mnt/1/VGG16_base /ssd_scratch/cvit/jobinkv/
cd /ssd_scratch/cvit/jobinkv
tar -xvf ./food-101.tar.gz
cd /home/jobinkv/VGG-with-Edge-Detection
python edge_trans.py
#python VGG16_ImgNet.py
python VGG16_edge.py
#python Merge-at-last.py
#rsync -avz /ssd_scratch/cvit/jobinkv/temp1  jobinkv@10.2.16.195:/home/jobinkv/cvpr_67/ /ssd_scratch/cvit/jobinkv/
