make openlane
mkdir pdks
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
echo $PDK_ROOT
echo $RUN_ROOT
cd  $PDK_ROOT
make skywater-pdk
make clone-open_pdks
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make install-open_pdks"
echo "done installing"
cd $RUN_ROOT
exit 0
