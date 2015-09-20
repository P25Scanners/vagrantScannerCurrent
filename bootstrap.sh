#!/usr/bin/env bash

apt-get update

mkdir vagrant_files

apt-get install -y git 

git clone git://github.com/pybombs/pybombs

#apt-get install -y gnuradio
#cd pybombs
#pwd
ls -a
#./pybombs env
#source /home/vagrant/pybombs/gnuradio/setup_env.sh

git clone https://github.com/gnuradio/gnuradio.git
mkdir $(srcdir)/build
cd $(srcdir)/build
cmake $(srcdir)
make
make test
make install -y

apt-get install -y libsndfile1-dev
apt-get install -y libitpp-dev
apt-get install -y cmake
apt-get install -y libboost-dev libboost-system-dev libboost-thread-dev 
apt-get install -y libcppunit-dev


git clone https://github.com/robotastic/gr-dsd.git
cd gr-dsd
cmake -DCMAKE_PREFIX_PATH=/home/vagrant/gnuradio   .
make
make install -y
ldconfig

cd ../
./pybombs install -y gr-op25


git clone https://github.com/robotastic/trunk-recorder.git
cd trunk-recorder
cmake -DCMAKE_PREFIX_PATH=/home/vagrant/gnuradio    . 
make
