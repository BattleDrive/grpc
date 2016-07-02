#!/bin/bash
cd "`dirname "$0"`"
export EMBED_OPENSSL=false
if [ "$(uname)" = "Darwin" ]; then
	env CONFIG=Mac make
	env CONFIG=IOS make static
else
	make
fi
