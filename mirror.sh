#!/bin/sh

set -ex

version="7"
src=http://centos.mirrors.proxad.net/${version}
dest=/downloads

for arch in "x86_64"
do
	for folder in "os" "extras" "updates" "centosplus"
	do
		arch_src="$src/$folder/$arch"
		arch_dest="$dest/${version}"
		mkdir -p "$arch_dest"
		wget \
			--mirror -nH --cut-dirs=1 --convert-links --adjust-extension --page-requisites --no-parent \
			"$arch_src" -P "$arch_dest"
	done
done

