################################################################################
## ashbox.sh conf:apache ########################################################

AshboxCommandRegister "conf:apache:vhost:ssl" "CommandConfigForApacheConf"

################################################################################
################################################################################

function CommandConfigForApacheConf() {(

	local Tab=$'\t'
	local Domain=$1

	if [ -z $Domain ]; then
		Domain='$SSLDomain'
	fi

	########

	#echo "SSLEngine             on"
	#echo "SSLProtocol           all -SSLv2 -SSLv3"
	#echo "SSLCipherSuite        ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:E"
	#echo "SSLHonorCipherOrder   on"
	#echo "SSLCompression        off"
	#echo "SSLOptions            +StrictRequire"
	echo "SSLCertificateFile    \"${Config['CertDir']}/${Domain}_ecc/$Domain.cer\""
	echo "SSLCertificateKeyFile \"${Config['CertDir']}/${Domain}_ecc/$Domain.key\""
	echo "SSLCACertificateFile  \"${Config['CertDir']}/${Domain}_ecc/fullchain.cer\""

	exit $KTHXBAI
)}
