#!/bin/bash

#cd "`dirname "$0"`/third_party/protobuf"
#autoreconf -f -i -Wall,no-obsolete
#cd ../..
cd "`dirname "$0"`
env CONFIG=opt make clean all
if [ "$(uname)" = "Darwin" ]; then
	env CONFIG=IOS make static
fi

