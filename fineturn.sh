#!/bin/bash
#SBATCH -A jobinkv
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=4096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
##''-------------------------#SBATCH -o copy.log

#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
module add cuda/8.0
module add cudnn/7-cuda-8.0
echo "I ran on:"
echo $SLURM_NODELIST

cd /home/jobinkv/fineturn_pytorch/
#python main.py
python imagenetTrain.py -a resnet18 
