g++ topology_extraction.cpp -o te

sector_len=4096
new_prefix=/home/ohdh95/work/DiskANN/scripts/indices/"$dataset"_R"$new_R"
./te /home/ohdh95/work/Cout/dynamic/disk_glove_R34/disk_init/_index_disk.index /home/ohdh95/work/Cout/dynamic/disk_glove_R34/disk_init/_index_disk.index_with_only_nbrs "$sector_len"
