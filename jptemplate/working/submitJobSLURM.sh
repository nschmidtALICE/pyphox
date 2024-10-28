#!/bin/bash
#SBATCH -J jetphox
#SBATCH -p long
# eval `alienv -w /software/flo/alice/sw/ --no-refresh load AliPhysics/latest lhapdf/latest`
# export LHAPDF_DATA_PATH=$LHAPDF_DATA_PATH:/cvmfs/sft.cern.ch/lcg/external/lhapdfsets/current:/alf/data/flo/pdfsets

# get current working directory
CURRENTDIR=`pwd`

# load jetphoxenv docker and run exe
# docker run -it --rm -v /alf/data/flo/PyPhox/:/home/PyPhox jetphoxenv:latest $CURRENTDIR/$1
#singularity
echo $CURRENTDIR
# replce in CURRENTDIR /alf/data/flo/PyPhox/ with /home/PyPhox
#CURRENTDIR=${CURRENTDIR/\/alf\/data\/flo\/PyPhox\//\/home\/PyPhox\/}
#singularity exec -B /alf/data/flo/PyPhox/:/home/PyPhox --pwd /home/PyPhox /alf/data/flo/singularityimages/jetphoxenv.sif 
$CURRENTDIR/$1

# time ./$1
# exit $?

:'
#!/bin/bash
#SBATCH -J jetphox
#SBATCH -p long
# eval `alienv -w /software/flo/alice/sw/ --no-refresh load AliPhysics/latest lhapdf/latest`
# export LHAPDF_DATA_PATH=$LHAPDF_DATA_PATH:/cvmfs/sft.cern.ch/lcg/external/lhapdfsets/current:/alf/data/flo/pdfsets

# get current working directory
CURRENTDIR=`pwd`
echo $CURRENTDIR
# load jetphoxenv docker and run exe
docker run -it --rm -v /media/niviths/local/pyphox/:/media/niviths/local/pyphox/ fjonas/jetphoxenv:latest $CURRENTDIR/$1
#docker run -it --rm -v /alf/data/flo/PyPhox/:/home/PyPhox jetphoxenv:latest $CURRENTDIR/$1
#singularity
#echo $CURRENTDIR
# replce in CURRENTDIR /alf/data/flo/PyPhox/ with /home/PyPhox
#CURRENTDIR=${CURRENTDIR/\/alf\/data\/flo\/PyPhox\//\/home\/PyPhox\/}
#CURRENTDIR=${CURRENTDIR/\/media\/niviths\/local\/pyphox\//\/home\/niviths/\PyPhox\/}
#singularity exec -B /media/niviths/local/pyphox/:/home/niviths/PyPhox --pwd /home/niviths/PyPhox /media/niviths/local/pyphox/jetphoxenv.sif $CURRENTDIR/$1
#singularity exec -B /alf/data/flo/PyPhox/:/home/PyPhox --pwd /home/PyPhox /alf/data/flo/singularityimages/jetphoxenv.sif $CURRENTDIR/$1

# time ./$1
# exit $?
'
