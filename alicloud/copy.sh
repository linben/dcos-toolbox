#!/usr/bin/sh

cd $HOME/genconf/serve/
for f in ./*
do
   osscmd put $f oss://blin-dcos-ee/2.0.0/
done

cd $HOME/genconf/serve/bootstrap/
for f in ./*
do
   osscmd put $f oss://blin-dcos-ee/2.0.0/bootstrap/
done

cd $HOME/genconf/serve/packages/
for d in *
do
   for file in $d/*
   do
       osscmd put $file oss://blin-dcos-ee/2.0.0/packages/$d/
   done
done

cd $HOME/genconf/serve/package_lists/
for f in ./*
do
   osscmd put $f oss://blin-dcos-ee/2.0.0/package_lists/
done
