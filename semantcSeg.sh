#!/bin/bash
#SBATCH -A research
#SBATCH -n 6
#SBATCH -c 6
#SBATCH --gres=gpu:4
#SBATCH --mem-per-cpu=4048
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END

module add cuda/8.0
module add cudnn/7-cuda-8.0

echo "I ran on:"
#cd $SLURM_SUBMIT_DIR
echo $SLURM_NODELIST
mkdir -p /ssd_scratch/cvit/jobinkv
rsync -avz jobinkv@ada:/share1/jobinkv/data/datasets/VOC /ssd_scratch/cvit/jobinkv/
cd /home/jobinkv/pytorch-semantic-segmentation/train/voc-psp_net
#
#./download_dataset.sh
#./train_fcn32s.py -g 4
python train.py
