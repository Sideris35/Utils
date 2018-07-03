#!/bin/bash
# set host ip for etcd, replace your own host IP before run it.
export HostIP="10.26.9.19"

#Lancement d'une session etcd dans un container 
docker run -d -v /usr/share/ca-certificates/:/etc/ssl/certs -p 4001:4001 -p 2380:2380 -p 2379:2379 \
 --name etcd quay.io/coreos/etcd \
 etcd \
 -name etcd0 \
 -advertise-client-urls http://${HostIP}:2379,http://${HostIP}:4001 \
 -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
 -initial-advertise-peer-urls http://${HostIP}:2380 \
 -listen-peer-urls http://0.0.0.0:2380 \
 -initial-cluster-token etcd-cluster-1 \
 -initial-cluster etcd0=http://${HostIP}:2380 \
 -initial-cluster-state new

#Lancement dans un container du service discovery
docker run --name discovery -d --net=host quay.io/coreos/discovery.etcd.io

#Test du bon fonctionnement
#Sleep le temps du lancement
sleep 5
curl -v -X PUT localhost:8087/new
