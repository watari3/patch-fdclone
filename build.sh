#!/bin/bash

###
fname=FD-3.01j.tar.gz
tar_fname=${fname%.*}
dir=${tar_fname%.*}

###
url=http://hp.vector.co.jp/authors/VA012337/soft/fd

###
if [ -e $fname ]; then
    echo "Info : Already file exist."
else
    wget ${url}/${fname}
fi

###
tar zxvf $fname
rm -rf $fname

###
cd ${dir}

patch < ../patch/fd.spec.patch

cd ..

###
tar cvf ${tar_fname} ${dir}
gzip -9 ${tar_fname}

###
rm -rf ${dir}

###
rpmbuild -ta ${fname}
