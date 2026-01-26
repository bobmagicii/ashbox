################################################################################
## ashbox.sh default: ##########################################################

AshboxCommandRegister "default:letsencrypt" "CommandDefaultLetsEncrypt"
AshboxCommandRegister "default:zerossl" "CommandDefaultZeroSSL"

################################################################################
################################################################################

function CommandDefaultLetsEncrypt() {(

	bash "${ASHBIN}" $ASHCFG --set-default-ca --server "letsencrypt"

	exit $KTHXBAI
)};

function CommandDefaultZeroSSL() {(

	bash "${ASHBIN}" $ASHCFG --set-default-ca --server "zerossl"

	exit $KTHXBAI
)};
