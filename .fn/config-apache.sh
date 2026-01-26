
AshboxCommandRegister "conf:apache" "CommandConfigForApacheConf"

################################################################################
################################################################################

CommandConfigForApacheConf() {(

	Domain=$1

	if [ -z $Domain ]; then
		Domain='$SSLDomain'
	fi

	########

	echo
	echo "VHOST SSL CONFIG"
	echo "================"
	echo
	echo "SSLCertificateFile    ${AshboxConfig['CertDir']}/${Domain}_ecc/$Domain.cer"
	echo "SSLCertificateKeyFile ${AshboxConfig['CertDir']}/${Domain}_ecc/$Domain.key"
	echo "SSLCACertificateFile  ${AshboxConfig['CertDir']}/${Domain}_ecc/fullchain.cer"
	echo

	exit $KTHXBAI
)}
