FROM quay.io/pypa/manylinux2010_i686

WORKDIR /tmp

COPY install_cmake.sh .
COPY install_swig.sh .

RUN yum install pcre-devel -y

RUN ./install_cmake.sh
RUN ./install_swig.sh

RUN rm -rf cmake*
RUN rm -rf swig*

RUN cmake --version
RUN swig -version
