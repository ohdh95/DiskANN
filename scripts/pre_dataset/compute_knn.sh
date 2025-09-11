g++ compute_knn.cpp -fopenmp -o ck

dataset=sift
basefile=/home/ohdh95/work/DiskANN/scripts/dataset/"$dataset"/"$dataset"_base.fbin
queryfile=/home/ohdh95/work/DiskANN/scripts/dataset/"$dataset"/"$dataset"_base.fbin
gt_prefix=/home/ohdh95/work/DiskANN/scripts/dataset/"$dataset"/gt
mkdir -p $gt_prefix
# 从0到50的数字进行循环
for i in {0..0}
do
    echo "当前轮次是 $i"

    #0~949999
    startid=$((0 + i * 40000))
    endid=$((999999))
    gtfile=$gt_prefix/"$dataset"_gt_K10_full.fbin
    ./ck "$basefile" "$queryfile" "$gtfile" "$startid" "$endid"
done

# *.cmake, *.txt, Makefile*, *.log, *.make, *.includecache, *.internal