#! /bin/bash

function podstatus (){
        sleep 1
	result1=$(kubectl --context=core get pods --field-selector=status.phase!=Succeeded,status.phase!=Running --all-namespaces)
	while [ ${#result1} -ne 0 ];
	do
		result1=$(kubectl --context=core get pods --field-selector=status.phase!=Succeeded,status.phase!=Running --all-namespaces)
		sleep 1
	done
}

kubectl --context=core apply -f arangodb-pv.yaml
sleep 20
kubectl --context=core apply -f arangodbbackup.yaml
podstatus
