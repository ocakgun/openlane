make openlane
mkdir pdks
export PDK_ROOT=$(pwd)/pdks
export RUN_ROOT=$(pwd)
cd  $PDK_ROOT
rm -rf skywater-pdk
git clone --depth 30 https://github.com/google/skywater-pdk.git skywater-pdk
echo "Done creating skywater-pdks"
cd skywater-pdk
echo "cd inside skywater-pdk"
echo $RUN_ROOT
echo $PDK_ROOT
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make skywater-library"
docker run -it -v $RUN_ROOT:/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make open_pdks"