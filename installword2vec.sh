#!/bin/bash
#SBATCH -A jobinkv
#SBATCH -n 2
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=4096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END

module add cuda/8.0
module add cudnn/7-cuda-8.0



