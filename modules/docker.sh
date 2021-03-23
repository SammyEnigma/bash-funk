#!/usr/bin/env bash
#
# Copyright 2015-2021 by Vegard IT GmbH (https://vegardit.com)
# SPDX-License-Identifier: Apache-2.0
#
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH
#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/docker.md
#

if hash docker &>/dev/null; then
function -docker-debug() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-docker-debug() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Installs and executes the docker-debug tool (https://github.com/zeromake/docker-debug)."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### docker-debug ####### START
sudo journalctl -u docker.service -f -n20
####### docker-debug ####### END
}
function __complete-docker-debug() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}docker-debug -- ${BASH_FUNK_PREFIX:--}docker-debug

function -docker-log() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-docker-log() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Displays dockerd's log messages in realtime."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### docker-log ####### START
sudo journalctl -u docker.service -f -n20
####### docker-log ####### END
}
function __complete-docker-log() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}docker-log -- ${BASH_FUNK_PREFIX:--}docker-log

function -docker-netshoot() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-docker-netshoot() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Starts Netshoot (https://github.com/nicolaka/netshoot) - a network trouble-shooting container."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### docker-netshoot ####### START
echo "Select a network to troubleshoot:"
local containers=$(sudo docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}' | sort)
echo "   $containers" | head -1
local selection
eval -- "${BASH_FUNK_PREFIX:--}choose --assign selection $(echo -n "'Docker Host Network' " && echo "$containers" | tail +2 | while read line; do printf "%s" "'$line' "; done)" || return 1
if [[ $selection == "Docker Host Network" ]] ; then
   echo "Attaching to Docker host network..."
   sudo docker run -it --rm --net host nicolaka/netshoot
else
   local containerId=$(${BASH_FUNK_PREFIX:--}substr-after-last "$selection" " ")
   echo "Attaching to network of container [$containerId]..."
   sudo docker run -it --rm --net container:$containerId nicolaka/netshoot
fi
####### docker-netshoot ####### END
}
function __complete-docker-netshoot() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}docker-netshoot -- ${BASH_FUNK_PREFIX:--}docker-netshoot

function -docker-sh() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-docker-sh() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _user _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Displays a list of all running containers and starts an interactive shell (/bin/sh) for the selected one."
            echo
            echo "Options:"
            echo -e "\033[1m-u, --user USER\033[22m"
            echo "        Login user."
            echo "    -----------------------------"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --user|-u)
            _user="@@##@@"
            __optionWithValue=user
         ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               user)
                  _user=$__arg
                  __optionWithValue=
                 ;;
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ $_user ]]; then
      if [[ $_user == "@@##@@" ]]; then echo "$__fn: Error: Value USER for option --user must be specified."; return 64; fi
   fi

####### docker-sh ####### START
echo "Select a container to enter:"
local containers=$(sudo docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.ID}}' | sort)
echo "   $containers" | head -1
local selection
eval -- "${BASH_FUNK_PREFIX:--}choose --assign selection $(echo "$containers" | tail +2 | while read line; do printf "%s" "'$line' "; done)" || return 1
echo "Entering [$(${BASH_FUNK_PREFIX:--}substr-before "$selection" " ")]..."
if [[ $_user ]]; then
   sudo docker exec -u $_user -it $(${BASH_FUNK_PREFIX:--}substr-after-last "$selection" " ") /bin/sh
else
   sudo docker exec -it $(${BASH_FUNK_PREFIX:--}substr-after-last "$selection" " ") /bin/sh
fi
####### docker-sh ####### END
}
function __complete-docker-sh() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --user -u --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}docker-sh -- ${BASH_FUNK_PREFIX:--}docker-sh

function -docker-top() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-docker-top() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Starts Dockly (https://lirantal.github.io/dockly/)."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### docker-top ####### START
sudo docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock lirantal/dockly
####### docker-top ####### END
}
function __complete-docker-top() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}docker-top -- ${BASH_FUNK_PREFIX:--}docker-top

function -swarm-cluster-id() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-swarm-cluster-id() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Prints the Swarm cluster ID."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### swarm-cluster-id ####### START
sudo docker info 2>/dev/null | grep --color=never -oP '(?<=ClusterID: ).*'
####### swarm-cluster-id ####### END
}
function __complete-swarm-cluster-id() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}swarm-cluster-id -- ${BASH_FUNK_PREFIX:--}swarm-cluster-id

function -test-all-docker() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-test-all-docker() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               *)
                  __params+=("$__arg")
            esac
           ;;
      esac
   done

   for __param in "${__params[@]}"; do
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

####### test-all-docker ####### START
${BASH_FUNK_PREFIX:--}docker-debug --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}docker-log --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}docker-netshoot --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}docker-sh --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}docker-top --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}swarm-cluster-id --selftest && echo || return 1
####### test-all-docker ####### END
}
function __complete-test-all-docker() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-all-docker -- ${BASH_FUNK_PREFIX:--}test-all-docker


function -help-docker() {
   local p="\033[1m${BASH_FUNK_PREFIX:--}"
   echo -e "${p}docker-debug\033[0m  -  Installs and executes the docker-debug tool (https://github.com/zeromake/docker-debug)."
   echo -e "${p}docker-log\033[0m  -  Displays dockerd's log messages in realtime."
   echo -e "${p}docker-netshoot\033[0m  -  Starts Netshoot (https://github.com/nicolaka/netshoot) - a network trouble-shooting container."
   echo -e "${p}docker-sh\033[0m  -  Displays a list of all running containers and starts an interactive shell (/bin/sh) for the selected one."
   echo -e "${p}docker-top\033[0m  -  Starts Dockly (https://lirantal.github.io/dockly/)."
   echo -e "${p}swarm-cluster-id\033[0m  -  Prints the Swarm cluster ID."
   echo -e "${p}test-all-docker\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."
}
__BASH_FUNK_FUNCS+=( docker-debug docker-log docker-netshoot docker-sh docker-top swarm-cluster-id test-all-docker )

function -docker-debug() {
   if hash docker-debug &>/dev/null; then
      sudo docker-debug "$@"
      return
   fi

   if [[ ! -e ~/.docker-debug/docker-debug.bin ]]; then
      echo "Installing the docker-debug tool (https://github.com/zeromake/docker-debug)..."
      mkdir -p ~/.docker-debug
      if [[ $OSTYPE == "darwin"* ]]; then
         curl -Lo ~/.docker-debug/docker-debug.bin https://github.com/zeromake/docker-debug/releases/download/0.6.3/docker-debug-darwin-amd64-upx
         chmod 700 ~/.docker-debug/docker-debug.bin
      elif [[ $OSTYPE == "linux"* ]]; then
         curl -Lo ~/.docker-debug/docker-debug.bin https://github.com/zeromake/docker-debug/releases/download/0.6.3/docker-debug-linux-amd64-upx
         chmod 700 ~/.docker-debug/docker-debug.bin
      else
         echo "$OSTYPE is not supported!"
         return 1
      fi
   fi

   sudo ~/.docker-debug/docker-debug.bin "$@"
}

function -docker-slim() {
   # https://github.com/docker-slim/docker-slim
   if [ $# -eq 0 ]; then
      sudo docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim help
   else
      sudo docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim "$@"
    fi
}

else
   echo "SKIPPED"
fi
