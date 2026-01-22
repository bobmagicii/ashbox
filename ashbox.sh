#!/usr/bin/env bash

################################################################################
################################################################################

BaseDir=`dirname "$(realpath $0)"`
TempDir="/tmp/ashbox"
InstDir="$BaseDir/.ash"
ConfDir="$BaseDir/.cfg"
CertDir="$BaseDir/certs"
HelpDir="$BaseDir/docs"

RepoURL="https://github.com/acmesh-official/acme.sh"

################################################################################
################################################################################

ASHBIN="$InstDir/acme.sh"
ASHCFG="--home $InstDir --cert-home $CertDir --config-home $ConfDir"
ASHCMD=$1
ASHARG=${@: 2}

################################################################################
################################################################################

ShowHelpFile() {
	echo
	cat $HelpDir/$1
	echo
}

################################################################################
################################################################################

CommandApacheConf() {

	Domain=$1

	if [ -z $Domain ]; then
		Domain='$SSLDomain'
	fi

	echo
	echo "VHOST SSL CONFIG"
	echo "================"
	echo
	echo "SSLCertificateFile    ${CertDir}/${Domain}_eec/$Domain.cer"
	echo "SSLCertificateKeyFile ${CertDir}/${Domain}_eec/$Domain.key"
	echo "SSLCACertificateFile  ${CertDir}/${Domain}_eec/fullchain.cer"
	echo

	exit 0
}

CommandInstall() {

	ContactEmail=$1

	########

	if [ -z "$ContactEmail" ];
	then
		ShowHelpFile ashbox-install.txt
		exit 1
	fi

	########

	# grab the code.

	rm -rf $TempDir
	git clone $RepoURL $TempDir

	# run its installer with the config.

	cd $TempDir
	bash ./acme.sh $ASHCFG --install -m $ContactEmail
	bash $ASHBIN $ASHCFG --set-default-ca --server letsencrypt

	# cleanup the install.

	cd $BaseDir
	rm -rf $TempDir

	########

	exit 0
}

CommandIssue() {

	Domains=""
	PArgs=""

	########

	for Arg;
	do
		if [[ $Arg =~ \. ]];
		then
			Domains+="-d $Arg "
		elif [[ $Arg == "--porkbun" ]];
		then
			PArgs+="--dns dns_porkbun"
		else
			PArgs+="$Arg "
		fi
	done

	########

	if [[ -z $Domains ]];
	then
		ShowHelpFile ashbox-issue.txt
		exit 0
	fi

	########

	echo $ASHBIN $ASHCFG --issue $PArgs $Domains
	exit 0
}

CommandList() {

	echo
	bash $ASHBIN $ASHCFG --list | tr -s " " ","
	echo

	exit 0
}

CommandHelp() {
	ShowHelpFile ashbox.txt
	exit 0
}

CommandRemove() {

	Domains=""

	########

	for Domain do
		Domains+="-d $Domain "
	done

	if [[ -z $Domains ]];
	then
		ShowHelpFile ashbox-remove.txt
		exit 0
	fi

	########

	bash $ASHBIN $ASHCFG --revoke $Domains
	bash $ASHBIN $ASHCFG --remove $Domains
	exit 0
}

################################################################################
################################################################################

if [ "$ASHCMD" == 'issue' ];
then
	CommandIssue $ASHARG

elif [ "$ASHCMD" == 'remove' ];
then
	CommandRemove $ASHARG

elif [ "$ASHCMD" == 'list' ];
then
	CommandList $ASHARG

elif [ "$ASHCMD" == 'install' ];
then
	CommandInstall $ASHARG

elif [ "$ASHCMD" == 'apacheconf' ];
then
	CommandApacheConf $ASHARG

else
	CommandHelp

fi

################################################################################
################################################################################
