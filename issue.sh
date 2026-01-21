#!/bin/bash

BaseDir=`pwd`
TempDir="/tmp/ashbox"
InstDir="$BaseDir/.ash"
ConfDir="$BaseDir/.cfg"

DomainList=""

for arg do
	DomainList+="-d arg "
done

echo $InstDir/acme.sh --issue --dns dns_porkbun $DomainList
