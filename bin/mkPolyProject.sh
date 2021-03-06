#!/bin/bash

## functions and variables

script=$(basename $0)

function doHelp() {
   local exit_code=0
   local hasMessage=0

   [ $# -ne 0 ] && exit_code=$1 && shift
   [ $# -ne 0 ] && hasMessage=1
   [ ${hasMessage} -ne 0 ] && \
      echo "ERROR: $*" 1>&2

   cat << DOHELP
${script} [-h|--help] : show this text and exits
${script} -v|--version: show the version and exits
${script} projectName [title] : the project and its
            optional title
DOHELP

   exit ${exit_code}
}

[ $# -eq 0 ] && doHelp
case $1 in
   -h|--help)
      dohelp
      ;;
   -v|--version)
      echo "${script} version 1.0.0"
      exit 0
esac

project=$1 && shift
title=$project
[ $# -ne 0 ] && title="$*"

mkdir ${project} || doHelp 1 "Unable to create $project directory"

cd $project || doHelp 1 "Unable to access $project directory"

cat > Makefile << MAK
# =================================================================
# Makefile for ${project}
# Distributed under terms of the MIT license.
# =================================================================

PROJECT = ${project}

DEPS =

TEST_ARGS =

include ../mk/main.mk
MAK

cat > ${project}.sml << ML
(*
 * ${project}.sml
 * Copyright (C) $(date "+%Y") ${USER} <${USER}@$(hostname -f)>
 *
 * Distributed under terms of the MIT license.
 *
 * To try it:
 *    polyc -o ${project} ${project}.sml && ./${project} *
 * or, better:
 *    make test
 *
 *)

fun main() =
   let
      fun processArgs []      =
         (print "Hello, brave new world!\n";
          OS.Process.exit OS.Process.success)

       |  processArgs(x::tail) =
            (print ("Hello " ^ x ^ "\n");
            processArgs tail)
   in
      (stdArgs (CommandLine.arguments());
        processArgs (CommandLine.arguments()))
   end
ML

cat > README.md << MD
# ${title}

A nice project in ML
MD

cat > stdArgs.sml << ARGS
(*
 * stdArgs.sml
 * Copyright (C) $(date "+%Y") ${USER} <${USER}@$(hostname -f)>
 *
 * Distributed under terms of the MIT license.
 *)


fun stdArgs [] =
   print("\n")

| stdArgs("--help"::tail) =
   (print "${project} [--help|--version]\n";
    print " --help: this text\n";
    print " --version: print version and exit\n";
    OS.Process.exit OS.Process.success)

| stdArgs("--version"::tail) =
   (print "${project} version 0.0.0\n";
    OS.Process.exit OS.Process.success)

| stdArgs(_::tail) =
   stdArgs tail
ARGS
