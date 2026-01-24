
CommandRemove() {

	local Domain=""
	local DoClean=0

	########

	for Arg;
	do
		if [[ $Arg == "--clean" ]];
		then
			DoClean=1
		else
			Domain=$Arg
		fi
	done

	########

	if [[ -z $Domain ]];
	then
		ShowHelpFile ashbox-remove.txt
		exit 0
	fi

	########

	bash "$ASHBIN" $ASHCFG --remove -d $Domain

	if [[ $DoClean -eq 1 ]];
	then
		rm -rf "${CertDir}/${Domain}_ecc"
	fi

	exit 0
}
