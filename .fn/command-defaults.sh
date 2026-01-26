
CommandDefaultLetsEncrypt() {

	bash "${ASHBIN}" $ASHCFG --set-default-ca --server "letsencrypt"

	exit $OK
}

CommandDefaultZeroSSL() {

	bash "${ASHBIN}" $ASHCFG --set-default-ca --server "zerossl"

	exit $OK
}
