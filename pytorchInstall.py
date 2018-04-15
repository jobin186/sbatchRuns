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
echo "I ran on:"
echo $SLURM_NODELIST
cd /home/jobinkv/torch/
TORCH_LUA_VERSION=LUA52 ./install.sh
#python setup.py install --user
