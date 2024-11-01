#!/bin/bash
DATE=`date +%Y_%m_%d`
RANDOMX=12345
NEVENTS=5000000
BORNBOX=2
ISO=2

# set path to find module
source /etc/profile.d/modules.sh

module use /software/centralsoft/Modules
module load singularity

RUNOPTIONS="--prefix Test_${DATE} --pdf1 nNNPDF30_nlo_as_0118_A208_Z82 --pdfmember1 0 --pdf2 nNNPDF30_nlo_as_0118_A208_Z82 --pdfmember2 0 --scaleis 1.0 --scalefs 1.0 --scalerenorm 1.0 --process dir --higherorder true --cme 5020 --maxrap 0.8 --minrap -0.8 --isoconeradius 0.4 --isoenergy $ISO --numberofevents $NEVENTS --randomseed $RANDOMX --directcalculation $BORNBOX --jetrapmin -5.8 --jetrapmax 5.8 --skipcopy false"


# build all files needed (inside docker)
# sudo docker run -it --rm -v /alf/data/flo/PyPhox/:/home/PyPhox jetphoxenv:latest ./run_jetphox build $RUNOPTIONS
# run instead with singularity
#singularity exec -B /alf/data/flo/PyPhox/:/home/PyPhox --pwd /home/PyPhox /alf/data/flo/singularityimages/jetphoxenv.sif /home/PyPhox/run_jetphox build $RUNOPTIONS
#singularity exec -B /media/niviths/local/pyphox:/home/niviths/PyPhox --pwd /home/niviths/PyPhox /alf/data/flo/singularityimages/jetphoxenv.sif /home/PyPhox/run_jetphox build $RUNOPTIONS
singularity exec -B /media/niviths/local/pyphox:/home/niviths/PyPhox --pwd /home/niviths/PyPhox /media/niviths/local/pyphox/jetphoxenv.sif /home/niviths/PyPhox/run_jetphox build $RUNOPTIONS

#singularity exec -B /home/niviths/PyPhox/:/home/PyPhox --pwd /home/PyPhox /media/niviths/local/pyphox/jetphoxenv.sif /home/PyPhox/run_jetphox build $RUNOPTIONS

# submit job to slurm (outside docker, since docker container does not know sbatch)
# TODO fix bug that paths are not correct
./run_jetphox submit $RUNOPTIONS


#/media/niviths/local/pyphox:/home/niviths/PyPhox
