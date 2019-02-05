cd kernel

export CROSS_COMPILE=$(pwd)/../tools/toolchain/arm-eabi/bin/
export ARCH=arm && export SUBARCH=arm

mkdir -p out

make O=out clean
#make O=out mrproper
make O=out dorado_defconfig
make O=out -j$(nproc --all)

echo "Build complete!"
echo "zImage in: "$(pwd)/out/arch/arm/boot
echo "Converting to boot image..."

cp out/arch/arm/boot/zImage-dtb ../boot-image
cd ../boot-image

./do-all.sh

cd ..
