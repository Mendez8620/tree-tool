#!/bin/bash
THIS=`dirname $0`
source $THIS/../bash_common.sh
if [ $# -ne 2 ]; then
  echo "Undo search for failed objects in #1/log/, remove #1/log"
  echo "#1: incremental distance tree directory"
  echo "#2: grid is used (0/1)"
  exit 1
fi
INC=$1
GRID=$2

  
ls $INC/log > $INC/log.list-all
ls $INC/search > $INC/search.list
$THIS/../setIntersect.sh $INC/log.list-all $INC/search.list 0 > $INC/log.list
rm $INC/log.list-all
rm $INC/search.list
L=`cat $INC/log.list | wc -l`
if [ $L -gt 0 ]; then
  echo -e "${RED}# Failed tasks: $L${NOCOLOR}"
  if [ $GRID == 0 ]; then
    exit 1
  fi
  # Try to fix grid problems
  $THIS/../trav $INC/log.list -step 1 "$THIS/distTree_inc_unsearch.sh $INC %f"
  $THIS/../trav $INC/log "echo ''; echo %d/%f; tail -20 %d/%f" > $INC/log.out  # PAR
  head -21 $INC/log.out  # PAR
  rm $INC/log.out
fi
rm $INC/log.list

rm -r $INC/log/
    