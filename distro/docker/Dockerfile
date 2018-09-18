FROM nvidia/opengl:1.0-glvnd-runtime

RUN apt-get update

COPY . /director

WORKDIR /director

RUN yes "Y" | TRAVIS_OS_NAME=linux /director/distro/travis/install_deps.sh

RUN rm -rf build || true && mkdir build

RUN cd build && cmake -DDD_QT_VERSION:STRING=4 \
    -DUSE_PRECOMPILED_VTK:BOOL=OFF \
    -DUSE_LCM:BOOL=ON \
    ../distro/superbuild && make -j8

ENV PYTHONPATH=/director/build/install/lib/python2.7/site-packages:/director/build/install/lib/python2.7/dist-packages/lcm
ENV LD_LIBRARY_PATH=/director/build/install/lib
ENV QT_X11_NO_MITSHM=1

ENTRYPOINT ["/director/build/install/bin/drake-visualizer", "--data", "/director/build/src/vtk/Examples/GUI/Win32/SampleMFC/weldedSpheres.vtk"]
