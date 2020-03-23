# ----------
# GrowthPred
# ----------
# Script modified from Shengwei Hou using his docker image, thanks Shengwei!

#name of docker container, use to kill later
GrowthPred_CONTAINER="GORG_growthpred"
#name of output folder
GrowthPredOut="growthpred-output"

#make output dir if does not exist
mkdir -p $GrowthPredOut

# initialize a container in background
docker run -t -d --rm \
           -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro \
           -u $(id -u $USER):$(id -g $USER) \
           -v $PWD:/mnt \
           --name ${GrowthPred_CONTAINER} shengwei/growthpred:latest

# allowing growthpred to predict HEG itself using its internal blast functionality 
for cds_file in 00-SAR86-SAGs/prokka/*/*ffn ;  do

    GrowthPred_DIR=`dirname $cds_file`
    cds_filename=$(basename $cds_file)
    cds_filestem=`basename $cds_file .ffn`
    echo ${cds_file}

    cmd="/growthpred/growthpred-v1.08.py -d $GrowthPred_DIR -g ${cds_filename} -o $GrowthPredOut/$cds_filestem \
                   -s -S -c 0 -t -m -b 2>&1 | tee -a growthpred.log"
    echo $cmd

    docker exec ${GrowthPred_CONTAINER} /bin/bash -c "$cmd"

done

# kill container
docker container kill ${GrowthPred_CONTAINER}
#COMMENT
