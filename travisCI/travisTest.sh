dir=$1
test_set=$2
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "python3 run_designs.py -d $(cat $dir/$test_set) -t TEST_$test_set -b regression_results/benchmark_results/SW_HD.csv"
val=$(grep "FAILED" $RUN_ROOT/regression_results/TEST_$test_set*/TEST_$test_set*_design_test_report.csv | wc -l)
if ! [[ $val ]]; then val=0; fi

exit $val