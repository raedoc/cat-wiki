#!/bin/bash
# when we run this file, interpret it in bash

PROGRAM=./server
# any port below 1024 is priveledged and requires root access
PORT=3330

# run server in the background
$PROGRAM $PORT &

# curl the server
CURLED=`curl localhost:$PORT`

# kill the server :(
kill %1

# assert that curl output is what we expect
function assert_match() {
  if echo "$1" | grep "$2"
  then
    echo "passed"
  else
    echo "expected $1 to contain $2, but did not"
  fi
}

assert_match "$CURLED" "GET / HTTP/1.1"