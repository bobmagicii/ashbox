

AshboxCommandRegister "help" "CommandHelp"

################################################################################
################################################################################

CommandHelp() {(

	PrintH1 "ashbox v${Version}"
	ShowHelpFile "ashbox.txt"

	exit $ERR_HELP;
)};
