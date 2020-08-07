make openlane
mkdir pdks
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
echo $PDK_ROOT
echo $RUN_ROOT
cd  $PDK_ROOT
rm -rf skywater-pdk
git clone https://github.com/google/skywater-pdk.git skywater-pdk
echo "cloned skywater-pdk"
cd skywater-pdk
echo "went into skywater-pdk"
cd  $PDK_ROOT/skywater-pdk
echo "went into skywater-pdk"
git submodule update --init libraries/sky130_fd_sc_hd/latest
echo "got submodule"
make sky130_fd_sc_hd
echo "ran make on sky130_fd_sc_hd" 
cd $PDK_ROOT 
rm -rf open_pdks 
git clone https://github.com/RTimothyEdwards/open_pdks.git open_pdks
echo "cloned open_pdks"
cd open_pdks 
echo "went into open_pdks"
git checkout -qf 60b4f62aabff2e4fd9df194b6db59e61a2bd2472
echo "checkedout open_pdks"
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make install-open_pdks"
echo "done installing"
exit 0
