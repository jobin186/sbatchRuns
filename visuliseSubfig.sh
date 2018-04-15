#!/bin/bash
#SBATCH -A research
#SBATCH -c 4
#SBATCH -n 4
#SBATCH --gres=gpu:0
#SBATCH --mem-per-cpu=4096
#SBATCH --time=1-00:00:00
#SBATCH --mail-type=END
##''-------------------------#SBATCH -o copy.log

#export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6:/usr/lib/x86_64-linux-gnu/libprotobuf.so.9
#module add cuda/8.0
#module add cudnn/7-cuda-8.0
module add matlab/R2017b

inputFig="jobinkv@ada:/share1/jobinkv/pdfFig2/Img" # a folder contain figures which canbe acced by any node
fold="Img"
outPut="/home/jobinkv/subFigs_CVPR"
mkdir -p $outPut

echo "I ran on:"
echo $SLURM_NODELIST
SSD="/ssd_scratch/cvit/jobinkv/"
Out=$SSD"out/"
mkdir -p $Out
rsync -avz $inputFig $SSD

#wget http://www.leptonica.org/source/leptonica-1.74.4.tar.gz .
#echo 'copying done!'
#cd /home/jobinkv/pytorch-semantic-segmentation/train/voc-psp_net/
cd /home/jobinkv/pdffigures2

matlab -nodesktop -nosplash -r "visulSubfig('"$SSD$fold"/','"$SSD"out/')"
rsync -avz $SSD/out /home/jobinkv/
#sbt "run-main org.allenai.pdffigures2.FigureExtractorBatchCli /home/jobinkv/10pdfs/"
#sbt "run-main org.allenai.pdffigures2.FigureExtractorBatchCli -e -t 16 /home/jobinkv/10pdfs/ -s 10Pdfs.json -m /home/jobinkv/temp1/Img/ -g /home/jobinkv/temp1/Data/"
#python3 build_evaluation.py conference pdffigures2 -o new_evaluation.pkl
#python3 download_from_urls.py -g
