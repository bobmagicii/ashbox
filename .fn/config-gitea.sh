
AshboxCommandRegister "conf:gitea" "CommandConfigForGitea"

################################################################################
################################################################################

function CommandConfigForGitea() {(

	Domain=$1

	if [ -z $Domain ]; then
		echo "Missing Domain Name"
		exit 1
	fi

	########

	echo
	echo "Gitea custom/config/app.ini Config"
	echo "=================================="

	echo "KEY_FILE  = ${AshboxConfig['CertDir']}/${Domain}_ecc/${Domain}.key"
	echo "CERT_FILE = ${AshboxConfig['CertDir']}/${Domain}_ecc/fullchain.cer"
	echo

	exit $KTHXBAI
)}
