#!/bin/bash

if [ -z $1 ]; then
	echo 'Buffer parameter required.'
	exit 1
fi

nvim --server "$NVIM" --remote-expr "execute('buf $1 | edit')"
