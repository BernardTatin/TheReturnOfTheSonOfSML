#!/bin/bash

## mlCompile.sh
## can compile with polyML or mlTon from a project file
## which is a mlb file with light modifications

script=$(basename $0)
here=$(dirname $0)
lib_dir=$(cd ${here}; pwd)/lib
compiler=

dohelp () {
  local exit_code=0

  [ $# -ne 0 ] && exit_code=$1 && shift
  [ $# -ne 0 ] && echo "Error: $*"

  cat <<DOHELP
${script} [-h|--help]: this text
${script} polyc|mlton mlb mlb
DOHELP
  exit ${exit_code}
}

## no arguments: help only
[ $# -eq 0 ] && dohelp

## first argument analysis
case $1 in
  -h|--help)
    dohelp
    ;;
  polyc|mlton)
    compiler=$1
    shift
    ;;
  *)
    dohelp 1 "Bad argument $1"
    ;;
esac

## we must have at least one mlb file as argument
[ $# -eq 0 ] && dohelp 2 "We need at least one mlb file"

## for each files, we compile
while [ $# -ne 0 ]
do
  echo "${compiler} ${1} -- libs in ${lib_dir}"
  shift
done
