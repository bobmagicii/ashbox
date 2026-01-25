################################################################################
## ashbox.sh install############################################################

CommandInstall() {

	ContactEmail=$1
	DefaultCertAuth="letsencrypt"

	########

	if [[ -z $ContactEmail ]];
	then
		ShowHelpFile ashbox-install.txt
		exit $ERR
	fi

	########

	# grab the code.

	rm -rf "${TempDir}"
	git clone "${AcmeShRepoURL}" "${TempDir}"

	# run its installer with the config.

	cd "${TempDir}"
	bash ./acme.sh $ASHCFG --install -m "${ContactEmail}"
	bash "${ASHBIN}" $ASHCFG --set-default-ca --server "${DefaultCertAuth}"

	# cleanup the install.

	cd "${BaseDir}"
	rm -rf "${TempDir}"

	########

	exit $OK
}

################################################################################
################################################################################

# ...
