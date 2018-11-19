#!/bin/bash
export ASAN_OPTIONS='detect_leaks=0'
make -j6 && touch fuzzermain.c && make fuzzer
