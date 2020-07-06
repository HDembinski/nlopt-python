FROM quay.io/pypa/manylinux2010_x86_64

RUN yum update -y && yum install pcre-devel -y

WORKDIR /tmp
# Install cmake
RUN make_cmake.sh

WORKDIR /tmp
# Install swig
RUN make_swig.sh

RUN swig --help
RUN cmake --version
