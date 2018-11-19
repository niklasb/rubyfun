#!/bin/bash
set -e
cd $(dirname $0)

export ASAN_OPTIONS='detect_leaks=0'

mkdir -p seeds
RB=../miniruby
echo feel free to cancel after a while
sleep 2
for f in samples/1.rb `find .. -name \*.rb`; do echo $f
  hash=$(sha1sum $f | cut -d' ' -f1)
  $RB make_sample.rb $f seeds/${hash}.bin || true
done
