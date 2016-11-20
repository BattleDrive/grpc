#!/bin/bash

# example run command: env OPENSSL_INCLUDE="/Users/crazy/projects/solutions/cars_client/UE4/Engine/Source/ThirdParty/OpenSSL/1.0.2h/include/" OPENSSL_LIB_MAC="/Users/crazy/projects/solutions/cars_client/UE4/Engine/Source/ThirdParty/OpenSSL/1.0.2h/lib/Mac" OPENSSL_LIB_IOS="/Users/crazy/projects/solutions/cars_client/UE4/Engine/Source/ThirdParty/OpenSSL/1.0.2h/lib/IOS" ./build.sh

cd "`dirname "$0"`"
export EMBED_OPENSSL=false
if [ "$(uname)" = "Darwin" ]; then
	env CONFIG=Mac make
	env CONFIG=IOS make static
else
	make
fi
