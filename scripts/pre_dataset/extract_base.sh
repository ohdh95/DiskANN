g++ extract_base.cpp -o eb
dataset=sift
datanum=1000000
input_f=/home/ohdh95/update/Greator/scripts/dataset/"$dataset"/"$dataset"_base.fbin
output_f=/home/ohdh95/update/Greator/scripts/dataset/"$dataset"/"$dataset"_base_95.fbin
./eb "$input_f" "$output_f" "$datanum"

