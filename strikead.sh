#!/bin/bash
cd /home/serega/strikead
project='etl qa fusion support erlangxl rtb track min-reqs adtruth gaucho ebt ekdtree logre fusion2 deploy adb cassandra geoid 3rdparty-build elib luigi geoid-client shepherd bishop r3pc erleveldb s3sync elastic-mapreduce riak graphite-config cluster-generators ibrowse yabs rebar play-plugins giraffe cbase64-erlang-nif tulib erlang+protobuffs jstree erlando sbt-native-packager'
for i in $project
do
	git clone git@github.com:strikead/$i.git
done
