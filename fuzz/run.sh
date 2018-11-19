#!/bin/bash
set -e
cd $(dirname $0)

export ASAN_OPTIONS='detect_leaks=0'

mkdir -p work corpus seeds
cd work
../../fuzzer -rss_limit_mb=4096 -jobs=1000000 -workers=6  ../corpus ../seeds
