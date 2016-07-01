#!/bin/bash
cd "`dirname "$0"`"
if [ "$(uname)" = "Darwin" ]; then
	env CONFIG=Mac EMBED_OPENSSL=false make
	env CONFIG=IOS EMBED_OPENSSL=true make static
else
	env EMBED_OPENSSL=false make
fi

