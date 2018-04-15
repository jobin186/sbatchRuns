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
echo "I ran on:"
echo $SLURM_NODELIST
rsync -avz jobinkv@10.2.16.195:/mnt/1/workingPdfs /ssd_scratch/cvit/jobinkv/
#wget http://www.leptonica.org/source/leptonica-1.74.4.tar.gz .
#echo 'copying done!'
mkdir -p /ssd_scratch/cvit/jobinkv/temp_1/Img
mkdir -p /ssd_scratch/cvit/jobinkv/temp_1/Data
#cd /home/jobinkv/pytorch-semantic-segmentation/train/voc-psp_net/
cd /home/jobinkv/pdffigures2/
#sbt "run-main org.allenai.pdffigures2.FigureExtractorBatchCli /home/jobinkv/10pdfs/"
sbt "run-main org.allenai.pdffigures2.FigureExtractorBatchCli -e -t 16 /ssd_scratch/cvit/jobinkv/workingPdfs -s /ssd_scratch/cvit/jobinkv/temp_1/pdfStats.json -m /ssd_scratch/cvit/jobinkv/temp_1/Img/ -g /ssd_scratch/cvit/jobinkv/temp_1/Data/"

rsync -avz /ssd_scratch/cvit/jobinkv/temp_1  jobinkv@10.2.16.195:/mnt/1/
#python3 build_evaluation.py conference pdffigures2 -o new_evaluation.pkl
#python3 download_from_urls.py -g
#-i <value> | --dpi <value>       DPI to save the figures in (default 150)
# -s <value> | --save-stats <value>  Save the errors and timing information to the given file in JSON fromat
# -t <value> | --threads <value>         Number of threads to use, 0 means using Scalas default 
# -e | --ignore-error Dont stop on errors, errors will be logged and also saved in `save-stats` if set
#   -q | --quiet       Switches logging to INFO level
#  -d <value> | --figure-data-prefix <value>        Save JSON figure data to '<data-prefix><input_filename>.json'
# -c | --save-regionless-caption        Include captions for which no figure regions were found in the JSON data
#-g <value> | --full-text-prefix <value>        Save the document and figures into <full-text-prefix><input_filename>.json
#-m <value> | --figure-prefix <value>        Save figures as <figure-prefix><input_filename>-<Table|Figure><Name>-<id>.png. `id` will be 1 unless multiple figures are found with the same `Name` in `input_filename`
# -f <value> | --figure-format <value>        Format to save figures (default png)
#Exception in thread "sbt-bg-threads-1" java.lang.RuntimeException: Nonzero exit code returned from runner: 1
