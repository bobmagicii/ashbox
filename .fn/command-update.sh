################################################################################
## ashbox.sh update ############################################################

AshboxCommandRegister "update" "CommandUpdate"

################################################################################
################################################################################

function CommandUpdate() {(

	function UpdateSelf() {

		local Command="${AshboxGitCmd} pull"

		PrintH2 "Updating ashbox"
		echo
		$Command
		echo

		return $OK
	};

	function UpdateASH() {

		local Command="bash ${AcmeShCmd} ${AcmeShCfgFlags} --upgrade"

		PrintH2 "Updating acme.sh"
		echo
		$Command
		echo

		return $OK
	};

	################################################################
	################################################################

	UpdateSelf
	UpdateASH

	################################################################
	################################################################

	exit $KTHXBAI
)};
