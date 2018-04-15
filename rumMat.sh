#!/bin/bash
#SBATCH -A jobinkv
#SBATCH -n 2
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=4096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
#SBATCH -o CSG18.log

export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
module add cuda/8.0
module add cudnn/7-cuda-8.0
module add matlab/R2017b
cd /home/jobinkv/div-histdb_seg_v1
#matlab -nodesktop -nosplash -singleCompThread -r "main_v2('CB55')"
matlab -nodesktop -nosplash -singleCompThread -r "main_docSeg('CSG18')"
