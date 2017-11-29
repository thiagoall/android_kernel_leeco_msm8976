	#!/bin/bash
	echo "EssentialX Kernel Script"
	echo "By ThiagoX from xda-developers"
	
	export CROSS_COMPILE=~/aarch64-linaro/bin/aarch64-linux-android-
	export ARCH=arm64
	export SUBARCH=arm64

	make mrproper
	make clean
	
	out=~/essentialx-out;

	if [ -e $out ];
	then
	rm -rf ~/essentialx-out
	fi

	mkdir -p ~/essentialx-out
        
	make essentialx_defconfig
	make -j8 | tee ~/essentialx-out/build.log

	mv ~/essentialx/arch/arm64/boot/Image.gz-dtb ~/essentialx-out/zImage
	
	if [ -e ~/essentialx-out/zImage ];
	then
	echo "Build Success!"
	echo "Get your Kernel in '$out'"
	else
	echo "Build Failed!"
	fi

