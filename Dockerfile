From centos:latest

####################################################
# Environment
####################################################

CMD ["/bin/bash"]

####################################################
# Update OS
####################################################

RUN yum update -y && yum upgrade -y

####################################################
# Install EPEL and Software Center for python3 and PIP
####################################################

RUN yum -y install epel-release \
                   centos-release-scl

####################################################
# Install python2 & 3 dev environments, pip, etc
####################################################

RUN yum update -y && \
    yum -y install gcc \
                   make \
                   automake \
                   git \
                   vim \				   
	                 python-dev \
	                 python-pip \
                   python36 \
		      		     python36-setuptools
				   
RUN easy_install-3.6 pip
				   
RUN yum -y groupinstall "Development Tools"

#####################################################
# Install virtualenv
#####################################################

RUN pip install virtualenv
RUN pip3 install virtualenv

###############################################################
# Notes
# To Build: docker built -t <name> .
# To Run: docker run -it <name> /bin/bash
###############################################################
