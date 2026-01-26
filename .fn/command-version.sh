################################################################################
## ashbox.sh --version #########################################################

AshboxCommandRegister "--version" "CommandVersion"

################################################################################
################################################################################

function CommandVersion() {(

	echo "ashbox v${Version} [ acme.sh" $("$AcmeShCmd" $AcmeShCfgFlags --version | grep v) "]"

	exit $KTHXBAI
)};
