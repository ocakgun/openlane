make openlane
mkdir pdks
export PDK_ROOT=$(pwd)/pdks
docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) openlane:rc3  bash -c "make pdk"