
clear
project_dir=/home/ohdh95/work/DiskANN
# 상대경로(되는지는 모름)
# project_dir=..
id_map=2
# delete_dir="$project_dir/scripts/indices/sift_R34"
delete_dir="$project_dir/scripts/indices/sift_R32"
batchsize=0.001
find "$delete_dir" -mindepth 1 ! -path "$delete_dir/disk_init*" -exec rm -rf {} +

cp "$delete_dir/disk_init"/* "$delete_dir"/
cp /home/ohdh95/mnt/_index_pm.index /home/ohdh95/mnt/_index_pm_copy.index

rm -f /home/ohdh95/mnt/_index_pm_tmp.index
rm -f /home/ohdh95/mnt/_index_disk_tmp.index

rm -r "$delete_dir"/_index_temp
mkdir "$delete_dir"/_index_temp

rm -r "$delete_dir"/index_temp
mkdir -p "$delete_dir"/index_temp

set -e
cd /home/ohdh95/work/DiskANN/build && make -j 
cd /home/ohdh95/work/DiskANN/run

# 상대경로
# cd ../build && make -j 
# cd ../run

name=sift
mydir="/home/ohdh95/work/DiskANN/scripts"
# 상대경로
# mydir="."
index_type="float"
base_data_file="$mydir"/dataset/"$name"/"$name"_base_95.fbin
L_mem=75
# R_mem=34
R_mem=32
alpha_mem=1.2
L_disk=128
# R_disk=34
R_disk=32
alpha_disk=1.2
num_start=0
num_shards=100
num_pq_chunks=100
num_nodes_to_cache=0
# save_graph_file="$delete_dir"/_index
save_graph_file="$delete_dir"/_index
update=true
build=false
full_data_bin="$mydir"/dataset/"$name"/"$name"_base.fbin
query_bin="$mydir"/dataset/"$name"/"$name"_query.fbin
truthset="$mydir"/dataset/"$name"/gt/"$name"_gt_K10_
recall_k=10
search_L1=120
beamwidth=2
trace_file_prefix="$mydir"/trace/"$name"_trace_"$batchsize"/_trace
step=5
C=160


"$project_dir"/build/tests/overall_performance "$index_type" "$base_data_file" "$L_mem" "$R_mem" "$alpha_mem" "$L_disk" "$R_disk" "$alpha_disk" "$num_start" "$num_shards" "$num_pq_chunks" "$num_nodes_to_cache" "$save_graph_file" "$update" "$build" "$full_data_bin" "$query_bin" "$truthset" "$recall_k" "$search_L1" "$beamwidth" "$trace_file_prefix" "$step" "$id_map" 

