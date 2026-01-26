################################################################################
## ashbox.sh default: ##########################################################

AshboxCommandRegister "default:letsencrypt" "CommandDefaultLetsEncrypt"
AshboxCommandRegister "default:zerossl" "CommandDefaultZeroSSL"

################################################################################
################################################################################

function CommandDefaultLetsEncrypt() {(

	bash "${AcmeShCmd}" $AcmeShCfgFlags --set-default-ca --server "letsencrypt"

	exit $KTHXBAI
)};

function CommandDefaultZeroSSL() {(

	bash "${AcmeShCmd}" $AcmeShCfgFlags --set-default-ca --server "zerossl"

	exit $KTHXBAI
)};
