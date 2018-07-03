#!/bin/bash
#set -x
#List a checker
#mysql
#rabbitmq-server
#memcached 
#etcd (systemctl)
#apache2 (keystone et horizon)
#service glance-registry restart
#service glance-api restart
#service nova-api restart
#service nova-consoleauth restart
#service nova-scheduler restart
#service nova-conductor restart
#service nova-novncproxy restart
#service nova-api restart
#service neutron-server restart
#service neutron-linuxbridge-agent restart
#service neutron-dhcp-agent restart
#service neutron-metadata-agent restart
#service neutron-l3-agent restart
#service nova-api restart
#service cinder-scheduler restart
#service apache2 restart
#service heat-api restart
#service heat-api-cfn restart
#service heat-engine restart
#service magnum-api restart
#service magnum-conductor restart
#service mmurano-api restart
#service murano-engine restart

function check_service {
	resu_check=$(service ${service} status |grep "Active:")
}

liste="mysql rabbitmq-server memcached  glance-registry glance-api  nova-api nova-consoleauth nova-scheduler nova-conductor nova-novncproxy nova-api neutron-server neutron-linuxbridge-agent neutron-dhcp-agent neutron-metadata-agent neutron-l3-agent cinder-scheduler heat-api heat-api-cfn heat-engine magnum-api magnum-conductor murano-api murano-engine" 

for service in $liste
do 
	check_service
	echo "$service -- $resu_check"	
done

#Exeption keystone horizon etcd
