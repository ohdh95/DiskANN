g++ make_tags.cpp -o mt

dataset=sift
indices_prefix=/home/ohdh95/work/DiskANN/scripts/indices/"$dataset"_R32
mkdir $indices_prefix
fname="$indices_prefix"/disk_init/_index_disk.index.tags
dnum=950000
./mt $fname $dnum
