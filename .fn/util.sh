
ShowHelpFile() {
	echo
	cat $HelpDir/$1
	echo
}

ArrayJoin() {
	local IFS=$1

	shift
	echo "$*"
}

################################################################################
################################################################################

UpdateSelf() {

	local Command="$ASHGIT pull"

	echo "Updating Ashbox"
	echo "==============="
	echo
	$Command
	echo

}

UpdateASH() {

	local Command="bash $ASHBIN $ASHCFG --upgrade"

	echo "Updating acme.sh"
	echo "================"
	echo
	$Command
	echo

}
