cd src
cd simplecv
python setup.py install
cd ..
cp -r zxing-1.6/python-zxing/zxing.py cortex/lib/python2.6/
easy_install pip
pip install python-pymongo 
pip install mongoengine
pip install cherrypy
