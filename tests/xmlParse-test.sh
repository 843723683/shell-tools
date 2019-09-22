#!/usr/bin/env bash

source ../xmlParse.sh

XMLParse "benchmark.xml"

XMLGetItemContent CaseName xmlgroup
XMLGetItemNum xmlgroup xmlnum
XMLUnsetup

for i in `seq 0 ${#xmlgroup}`
do
	echo "${xmlgroup[$i]}"
done
echo $xmlnum
