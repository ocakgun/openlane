test_set=$1
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
echo $PDK_ROOT
echo $RUN_ROOT
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "python3 run_designs.py -d $(cat $RUN_ROOT/travisCI/$test_set) -t TEST_$test_set -th 20 -b regression_results/benchmark_results/SW_HD.csv"

FILE=$RUN_ROOT/regression_results/TEST_$test_set*/TEST_$test_set*_design_test_report.csv
if ! [[ -f $FILE ]]; then exit -1; fi
cat $FILE
val=$(grep "FAILED" $FILE | wc -l)
if ! [[ $val ]]; then val=0; fi
exit $val