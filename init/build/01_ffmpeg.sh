cd src
git clone git://git.videolan.org/x264
cd x264
./configure --enable-static
make
sudo checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | \
    awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes \
    --fstrans=no --default
cd ..
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb \
    --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libx264 \
    --enable-nonfree --enable-postproc --enable-version3 --enable-x11grab
make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
hash x264 ffmpeg ffplay ffprobe
