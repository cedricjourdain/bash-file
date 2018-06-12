#!/bin/bash
source ./env
module load hdf5/1.8.18 scotch/6.0.4 qt/4.8.6 parmetis/4.0.3-real64 python/2.7.12 hypre/2.11.1 petsc/3.7 med/3.0.8 cgns/3.3.1 eos/1.6.0
Untar(){ 	echo "************************************************************"; 	echo "* Untar Code_Saturne version $version et Neptune_cfd  in $compile_dir"; 	echo "************************************************************"; 	cd $compile_dir; 	tar -zxvf $HOME/tarballs/code_saturne-5.2-alpha_neptune_cfd-4.2.0.tar.gz; }
Configure_and_prepare(){ 	echo "************************************************************"; 	echo "* Configure Code_Saturne";     echo "*   install_dir = $install_dir ";     echo "*   compile_dir = $compile_dir ";     echo "*   version = $version ";     echo "************************************************************";     cd $compile_dir/$software-5.2-alpha_neptune_cfd-4.2.0;     pwd     export CC=mpicc;     export CXX=icpc;     export FC=mpifort;     export CFLAGS="-O3 -xCORE-AVX2 -qopenmp";     export FCFLAGS="-O3 -xCORE-AVX2 -qopenmp";     ./configure --prefix=$install_dir 		--with-blas="$MKLROOT" 		--with-blas-type=MKL 		--with-mpi=$MPIROOT 		--with-metis=$PARMETIS_DIR 		--with-scotch=$SCOTCH_DIR 		--with-hdf5=$HDF5HOME 	    --with-med=$MEDROOT 		--with-cgns=$CGNSROOT 		--with-petsc=$PETSC_DIR         --with-eos-lib=$EOSROOT/lib         --with-module=no;  	echo "************************************************************"; 	echo "* End configure Code_Saturne"; 	echo "************************************************************"; }
Install(){ 	echo "************************************************************"; 	echo "* Install Code_Saturne"; 	echo "************************************************************";     cd $compile_dir/$software-5.2-alpha_neptune_cfd-4.2.0;      make clean; 	make; 	make install; }
Install_neptune(){ 	echo "************************************************************"; 	echo "* Install Neptune"; 	echo "************************************************************";     cd $compile_dir/$software-5.2-alpha_neptune_cfd-4.2.0;      echo "============= Configure Neptune ================";     ./configure --prefix=$install_dir         CC=mpicc CFLAGS="-O3 -xCORE-AVX2 -qopenmp" FC=mpifort FCFLAGS="-O3 -xCORE-AVX2 -qopenmp"         --includedir=$install_dir/include/code_saturne         --libdir=$install_dir/lib; 	echo "================ End Configure ================";     make;     echo "================ End Make ================";     make check;     echo "================ End Make check ================"; 	make install;     echo "================ End Make install ================";     make installcheck;     echo "================ End Make installcheck ================"; }
Test(){ 	echo "************************************************************"; 	echo "* TEST "; 	echo "************************************************************"; 	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$compile_dir/code_saturne-$version/src/apps/.libs/:$compile_dir/code_saturne-$version/libple/src/.libs/; 	export PATH=$PATH:$compile_dir/code_saturne-$version/bin; 	echo "-------------------------------------------------------------------------------------------------------------"; 	echo "Check that user subroutines can be compiled and the code re-linked (you should see a link command at the end)"; 	echo "-------------------------------------------------------------------------------------------------------------"; 	echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"; 	$compile_dir/code_saturne-$version/bin/code_saturne compile -f -t;  	echo "---------------------------------------------------"; 	echo "Test the preprocessor by running it on a few meshes"; 	echo "---------------------------------------------------" 	echo "-------------------------------------"; 	echo " Test the kernel is linked correctly:"; 	echo "-------------------------------------"         $compile_dir/code_saturne-$version/src/apps/cs_solver }
Clean(){ 	echo "************************************************************"; 	echo "* clean : destruction du repertoire compile_dir"; 	echo "************************************************************"; 	make clean; 	rm -rf $compile_dir;  }
Deploy(){ 	echo "************************************************************"; 	echo "* Compilation de "$software" version "$version; 	echo "*    compilateur "$compiler $compiler_version; 	echo "*    libmpi      "$libmpi $mpi_release; 	echo "************************************************************"; 	if [ -d $install_dir ];then 		rm -rf $install_dir; 	fi; 	mkdir -p $install_dir; 	if [ ! -d $compile_dir ];then 		mkdir -p $compile_dir; 	fi;  	Untar; 	Configure_and_prepare; 	Install;     Install_neptune     echo "************************************************************";     echo " Change group ownership for code_saturn and Neptune";     echo "************************************************************" }
Deploy
echo $hello
echo hello
pwd
ls
cd Documents/
ls
cd Workspace/g
cd Workspace/git/
git clone https://dci-gitlab.cines.fr/cameo/hey-ho.git
git -c http.sslVerify=false clone https://dci-gitlab.cines.fr/cameo/hey-ho.git
ls
cd hey-ho/
ls -lrth
ls -lrth images/
more main.user.js 
cat main.user.js 
pwd
cd /drives/c/Users/jourdain/Downloads
cd /drives/c/Users/jourdain/Downloads
cd
ls
cd Downloads/
ls
gitdiff CMakeCache-fusion.txt CMakeCache-occigen.txt
vimdiff CMakeCache-fusion.txt CMakeCache-occigen.txt
vimdiff libhdf5-fusion.settings libhdf5-occigen.settings
ls -lrth
grep "FLAGS CMakeCache-occigen.txt
vimdiff CMakeCache-fusion.txt CMakeCache-occigen.txt
grep pthread CMakeCache-occigen.txt
grep -B 1 pthread CMakeCache-occigen.txt
ls
ls -lrth
ls -lrth Documents/
ls
cd Documents/
LS
l
ls -lrth
ls -a
cd Documents/
ls
ls -lrth
ls -lrtha
git config --global user.name "Jourdain"
git config --global user.email "cedric.jourdain56@gmail.com"
ls -lrth
ls -lrtha
ls -lrtha ..
vi ../.gitconfig 
git init
git status
more .bash_profile 
vi .bash_profile 
ls -lrth
ls -lrtha
ls -lrtha .git/
mv .bash_profile ..
rm -rf .git/
cd ..
git init
git status
vi .gitignore
git status
vi .gitignore
git status
vi .gitignore
git status
vi .gitignore
vi .gitignore
vi .gitignore
vi .gitignore
vi .gitignore
vi .gitignore
vi .gitignore
vi .gitignore1
mv .gitignore .gitignore2
mv .gitignore1 .gitignore
git status
rm .gitignore2
vi .bash_profile 
vi .bashrc
vi .gitignore 
git status
vi .bash_aliases
