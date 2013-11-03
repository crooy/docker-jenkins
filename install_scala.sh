#!/bin/sh
 
wget http://www.scala-lang.org/files/archive/scala-2.10.3.tgz
tar zxf scala-2.10.3.tgz
sudo mv scala-2.10.3 /usr/share/scala
 
 
sudo ln -s /usr/share/scala/bin/scala /usr/bin/scala
sudo ln -s /usr/share/scala/bin/scalac /usr/bin/scalac
sudo ln -s /usr/share/scala/bin/fsc /usr/bin/fsc
sudo ln -s /usr/share/scala/bin/scaladoc /usr/bin/scaladoc
sudo ln -s /usr/share/scala/bin/scalap /usr/bin/scalap
 
# remove sbt:>  sudo apt-get purge sbt. 
 
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.13.0/sbt.deb
sudo dpkg -i sbt.deb
sudo apt-get update
sudo apt-get install sbt
