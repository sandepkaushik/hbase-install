##
# This module ubuntu and download file from http://ftp.heanet.ie/mirrors/www.apache.org/dist/hbase/stable/hbase-1.2.3-bin.tar.gz 
# Save this file in ubuntu dekstop or server version @ /usr/local and unzip the same.
#Current source: http://git
##
cd /usr/local
#Before downloading the file from given link check whether there is new version available or not, otherwise you will get error.
# file name is hbase-1.2.4-bin.tar.gz
wget "http://ftp.heanet.ie/mirrors/www.apache.org/dist/hbase/stable/hbase-1.2.4-bin.tar.gz"
cd /usr/local
cp ~ /Downloads/hbase-1.2.4-bin.tar.gz .
cd /usr/local
sudo tar xzf hbase-1.2.4-bin.tar.gz
sudo ln -s hbase-1.2.4 hbase
sudo chown -R hduser:hadoop hbase-1.2.4
sudo mkdir /usr/data
sudo mkdir /usr/data/hbase
su root
cd /usr/local/hbase-1.2.4/conf
##Edit the below file and write the data.
##Under this file you will see below lines just add these after first two lines 
#<?xml version=”1.0”?>
#<?xml-stylesheet type=”text/xsl” href=”configuration.xsl”?> <configuration>
## Need to paste this and below lines
#<property> <name>hbase.rootdir</name> <value>file:///usr/data/hbase</value>
#</property> </configuration>
vi hbase-site.xml
#Now modify the habase-env.sh file location should be /usr/local/hbase
vi hbase-env.sh
#Edit this file and add below lines
#The java implementation to use. java 1.6 required.
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#Native libraries
export LD_LIBRARY_PATH=/usr/local/hadoop/lib/Native
cd /usr/local/hbase
bin/start-hbase.sh
bin/hbase shell
status


