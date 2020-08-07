design=$1
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "python3 run_designs.py -d $design -t TEST_$design -b regression_results/benchmark_results/SW_HD.csv"
grep "PASSED" $RUN_ROOT/regression_results/TEST_$design_*/TEST_$design_*_design_test_report.csv