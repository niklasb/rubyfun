#!/bin/bash
set -e
cd $(dirname $0)

export ASAN_OPTIONS='detect_leaks=0'

autoconf
./configure CC=clang \
  CFLAGS='-g2 -O3 -fsanitize=address -fsanitize-coverage=trace-pc-guard' \
  debugflags='-g2 -fsanitize=address -fsanitize-coverage=trace-pc-guard' \
  LDFLAGS='-fsanitize=address -fsanitize-coverage=trace-pc-guard' || exit 1
rm -f fuzzermain.o fuzzer
make -j6
make -j6 fuzzer
