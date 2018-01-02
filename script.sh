#!/bin/bash
cd $HOME/Downloads && mkdir tmp && cd tmp
filename="jdk-9.0.1_linux-x64_bin.tar.gz"
version="jdk-9.0.1"
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/$filename
tar -zxvf $filename
sudo mkdir /usr/local/java
sudo mv ./$version /usr/local/java
sudo echo -e "JAVA_HOME=/usr/local/java/$version\nJRE_HOME=\$JAVA_HOME/jre\nPATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin\nexport JAVA_HOME\nexport JRE_HOME\nexport PATH" >> /etc/profile
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/$version/jre/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/$version/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/$version/bin/javaws" 1
sudo update-alternatives --set java /usr/local/java/$version/jre/bin/java
sudo update-alternatives --set javac /usr/local/java/$version/bin/javac
sudo update-alternatives --set javaws /usr/local/java/$version/bin/javaws
source /etc/profile
cd $HOME/Downloads && rm -r tmp
echo "installation successfull"

