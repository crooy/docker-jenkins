#!/bin/sh

wget http://www.scala-lang.org/files/archive/scala-2.10.3.tgz
tar zxf scala-2.10.3.tgz
mv scala-2.10.3 /usr/share/scala


ln -s /usr/share/scala/bin/scala /usr/bin/scala
ln -s /usr/share/scala/bin/scalac /usr/bin/scalac
ln -s /usr/share/scala/bin/fsc /usr/bin/fsc
ln -s /usr/share/scala/bin/scaladoc /usr/bin/scaladoc
ln -s /usr/share/scala/bin/scalap /usr/bin/scalap

# remove sbt:>  sudo apt-get purge sbt.

wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.13.0/sbt.deb
dpkg -i sbt.deb
apt-get update
apt-get install sbt
