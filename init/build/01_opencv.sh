cd src
wget http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.3.1/OpenCV-2.3.1a.tar.bz2 
bunzip2 OpenCV-2.3.1a.tar.bz2
tar xvf OpenCV-2.3.1a.tar
cd OpenCV-2.3.1a
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_PYTHON_SUPPORT=ON -D WITH_TBB=ON -D CMAKE_INSTALL_PREFIX=/usr ..
make
make install
ln -s /usr/lib/python2.6/site-packages/cv.so /usr/lib/python2.6/cv.so
cd ../..
