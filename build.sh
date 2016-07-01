#!/bin/bash
cd "`dirname "$0"`"
make clean
if [ "$(uname)" = "Darwin" ]; then
	env CONFIG=Mac EMBED_OPENSSL=false make
	env CONFIG=IOS EMBED_OPENSSL=false make static
else
	env EMBED_OPENSSL=false make
fi

