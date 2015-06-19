# http://splunk.com
# https://index.docker.io/_/centos/
FROM centos

# https://github.com/sometheycallme
MAINTAINER Tim Kropp <timkropp77@gmail.com>

# Update the base image.
# RUN yum -y update

# Install dependencies.
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# Get splunk RPM
# requires splunk account
# 32-bit URL 
# ADD http://download.splunk.com/products/splunk/releases/6.2.3/splunk/linux/splunk-6.2.3-264376.i386.rpm /tmp/

# 64-bit url
# ADD http://download.splunk.com/products/splunk/releases/6.2.3/splunk/linux/splunk-6.2.3-264376-linux-2.6-x86_64.rpm /tmp/

# Get splunk Tarball
ADD http://download.splunk.com/products/splunk/releases/6.2.3/splunk/linux/splunk-6.2.3-264376-Linux-x86_64.tgz /tmp/

# use default install /opt/splunk
# Tarball: splunk-6.2.3-264376-Linux-x86_64.tar
RUN yum -y --nogpgcheck localinstall /tmp/splunk-6.2.3-264376-linux-2.6-x86_64.rpm 

# Remove yum metadata.
RUN yum clean all

# RUN /opt/splunk/bin ./splunk start --accept-license
COPY install.sh .
RUN chmod 755 install.sh
RUN sh install.sh

# Add install script
# ADD install.sh /tmp/
# RUN /tmp/install.sh

# Start Splunk: add enterprise license if applicable
# RUN /opt/splunk/bin/ splunk add licenses /opt/splunk/etc/licenses/enterprise/enterprise.lic

# Start splunk and accept the free license
# RUN /opt/splunk/bin/./splunk start --accept-license
