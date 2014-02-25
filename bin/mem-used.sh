#!/bin/sh
ps aux --sort rss | awk '{s += $6}{if($6 > 1024) print $1"\t\t"$6"\t\t"$11} END {print "Total use memory:" s" byte"}' | less
