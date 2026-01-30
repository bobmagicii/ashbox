################################################################################
## ashbox.sh cli:acmesh ########################################################

AshboxCommandRegister "conf:ashbox:shell:path" "CommandConfigForAshboxShellPath"

################################################################################
################################################################################

function CommandConfigForAshboxShellPath() {(

	local Arg
	local Tab=$'\t'

	################################################################
	################################################################

	function QueryAppRoot() {
		echo "${Config['AppRoot']}"
		return $KTHXBAI
	};

	function QueryAppScript() {
		echo "${Config['AppRoot']}/${Config['AshboxBinFile']}"
		return $KTHXBAI
	};

	function QueryPathAppended() {
		echo "\${PATH}:${Config['AppRoot']}"
		return $KTHXBAI
	};

	function QueryPathExportCommand() {
		echo "export PATH=\"$(QueryPathAppended)\""
		return $KTHXBAI
	};

	################################################################
	################################################################

	echo $(QueryPathExportCommand)

	exit $KTHXBAI
)};



