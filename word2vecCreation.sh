#!/bin/bash
#SBATCH -A jobinkv
#SBATCH -c 6
#SBATCH -n 1
#SBATCH --gres=gpu:0
#SBATCH --mem-per-cpu=2024
#SBATCH --time=2-00:00:00
#SBATCH --mail-type=END
#                  ###dd#SBATCH -o rvl.log
echo 'now I am in '
echo ${SLURM_NODELIST}
mkdir -p /ssd_scratch/cvit/jobinkv
cd /ssd_scratch/cvit/jobinkv 
#rm -r *

#file="./rvl-cdip.tar.gz"
#if [ ! -f "$file" ]
#then
#    echo "$0: File '${file}' not found."
rsync -avz jobinkv@10.2.16.195:/mnt/1/wiki4word2vec/enwiki-latest-pages-articles.xml.bz2 /ssd_scratch/cvit/jobinkv/
#tar -xvf $file
echo "the copying and extractions are done!"	
#else
#echo "Congratz The file exixts"
#fi
#cp -r ./labels /home/jobinkv/rvl_imageClassification/
#echo "$(ls ./labels/)"
#echo "$(du -sh ./rvl-cdip.tar.gz)"
echo 'all is well'
module load cuda/8.0
module load cudnn/7-cuda-8.0
cd /home/jobinkv/word2vec/
python process_wiki.py /ssd_scratch/cvit/jobinkv/enwiki-latest-pages-articles.xml.bz2 wikiout.txt
