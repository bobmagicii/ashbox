#!/usr/bin/env bash

################################################################################
## a s h b o x #################################################################

readonly Version="1.0.0-dev"

################################################################################
################################################################################

declare BaseBin=$(realpath "$0")
declare BaseDir=$(dirname "${BaseBin}")
declare InstDir="${BaseDir}/.ash"
declare ConfDir="${BaseDir}/.cfg"
declare HelpDir="${BaseDir}/.docs"
declare FuncDir="${BaseDir}/.fn"
declare CertDir="${BaseDir}/certs"
declare TempDir="/tmp/ashbox"

declare AshboxRepoURL="https://github.com/bobmagicii/ashbox"
declare AcmeShRepoURL="https://github.com/acmesh-official/acme.sh"

################################################################################
################################################################################

declare ASHBIN="${InstDir}/acme.sh"
declare ASHCFG="--home ${InstDir} --cert-home ${CertDir} --config-home ${ConfDir}"
declare ASHCMD=$1
declare ASHARG=${@: 2}
declare ASHGIT="git -C ${BaseDir}"
declare -A ASHCMDFNC

readonly OK=0
readonly ERR=1

################################################################################
################################################################################

readonly KTHXBAI=$OK
readonly OHSNAP=$ERR
readonly NAHIDK=-1

################################################################################
################################################################################

function AshboxCommandRegister() {

	# reference $ASHCMDFNC

	local Cmd=$1
	local Fnc=$2

	########

	ASHCMDFNC[$Cmd]=$Fnc

	return $KTHXBAI
};

function AshboxCommandExecute() {

	# reference $ASHCMDFNC
	# reference $ASHARG

	local Cmd=$1

	########

	if [[ -v ASHCMDFNC[$Cmd] ]];
	then
		${ASHCMDFNC[$Cmd]} $ASHARG
		exit $?
	fi

	########

	return $KTHXBAI
};

function AshboxPluginLoader() {

	local Dir=$1
	local File=""

	########

	for File in ${Dir}/*.sh;
	do
		source "${File}"
	done

	########

	return $KTHXBAI
};

################################################################################
################################################################################

if [[ $InstDir =~ " " ]];
then
	echo "acme.sh does not support spaces in paths."
	echo "There are several issues in it's GitHub issue tracker about it."
	echo "Most of them are closed with \"don't use spaces\"."
	exit 1
fi

################################################################################
################################################################################

AshboxPluginLoader "${FuncDir}"
AshboxCommandExecute "${ASHCMD}"

################################################################################
################################################################################

PrintH1 "ashbox v${Version}"
CommandHelp

exit $KTHXBAI;
