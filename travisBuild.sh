make openlane
mkdir pdks
export PDK_ROOT=$(pwd)/pdks
cd  $(PDK_ROOT)
rm -rf skywater-pdk
git clone --depth 30 https://github.com/google/skywater-pdk.git skywater-pdk
cd skywater-pdk
docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make skywater-library"
docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT openlane:rc3  bash -c "make open_pdks"