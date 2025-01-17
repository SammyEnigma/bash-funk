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
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/os.md
#

function -command-exists() {
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
      echo -e "\nUsage: $__fn [OPTION]... COMMAND\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-command-exists() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _verbose _COMMAND
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
            echo "Usage: $__fn [OPTION]... COMMAND"
            echo
            echo "Checks if the given program or function is available."
            echo
            echo "Parameters:"
            echo -e "  \033[1mCOMMAND\033[22m (required)"
            echo "      Name of the program or function."
            echo
            echo "Options:"
            echo -e "\033[1m-v, --verbose\033[22m"
            echo "        Prints additional information during command execution."
            echo "    -----------------------------"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            echo "Examples:"
            echo -e "$ \033[1m$__fn hash\033[22m"
            echo
            echo -e "$ \033[1m$__fn -v hash\033[22m"
            echo "'hash' is available."
            echo -e "$ \033[1m$__fn -v ls\033[22m"
            echo "'ls' is available."
            echo -e "$ \033[1m$__fn -v name-of-nonexistant-command\033[22m"
            echo "'name-of-nonexistant-command' not found."
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
            echo -e "$ \033[1m$__fn hash\033[22m"
            __stdout="$($__fn hash)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            if [[ -n "$__stdout" ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required string []."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn -v hash\033[22m"
            __stdout="$($__fn -v hash)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^'hash' is available.$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern ['hash' is available.]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn -v ls\033[22m"
            __stdout="$($__fn -v ls)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^'ls' is available.$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern ['ls' is available.]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn -v name-of-nonexistant-command\033[22m"
            __stdout="$($__fn -v name-of-nonexistant-command)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 1 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [1]."; return 64; fi
            __regex="'name-of-nonexistant-command' not found."
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern ['name-of-nonexistant-command' not found.]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --verbose|-v)
            _verbose=1
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
      if [[ ! $_COMMAND ]]; then
         _COMMAND=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ $_COMMAND ]]; then
      true
   else
      echo "$__fn: Error: Parameter COMMAND must be specified."; return 64
   fi

####### command-exists ####### START
if hash "$_COMMAND" &>/dev/null; then
   [[ $_verbose ]] && echo "'${_COMMAND}' is available." || :
   return 0
else
   [[ $_verbose ]] && echo "'${_COMMAND}' not found." || :
   return 1
fi
####### command-exists ####### END
}
function __complete-command-exists() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help --verbose -v "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}command-exists -- ${BASH_FUNK_PREFIX:--}command-exists

function -pkg-installed() {
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
      echo -e "\nUsage: $__fn [OPTION]... PACKAGE_NAME\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-pkg-installed() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _verbose _PACKAGE_NAME
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
            echo "Usage: $__fn [OPTION]... PACKAGE_NAME"
            echo
            echo "Determines if the given software package is installed."
            echo
            echo "Parameters:"
            echo -e "  \033[1mPACKAGE_NAME\033[22m (required)"
            echo "      Name of the package."
            echo
            echo "Options:"
            echo -e "\033[1m-v, --verbose\033[22m"
            echo "        Prints additional information during command execution."
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

         --verbose|-v)
            _verbose=1
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
      if [[ ! $_PACKAGE_NAME ]]; then
         _PACKAGE_NAME=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ $_PACKAGE_NAME ]]; then
      true
   else
      echo "$__fn: Error: Parameter PACKAGE_NAME must be specified."; return 64
   fi

####### pkg-installed ####### START
if hash "yum" &>/dev/null; then
   if yum list installed "${_PACKAGE_NAME}" &>/dev/null; then
      [[ $_verbose ]] && echo "${_PACKAGE_NAME} is installed." || :
      return 0
   fi

elif hash "dpkg-query" &>/dev/null; then
   if dpkg-query -Wf'${Status}' "${_PACKAGE_NAME}" 2>/dev/null | grep "install ok installed" &>/dev/null; then
      [[ $_verbose ]] && echo "${_PACKAGE_NAME} is installed." || :
      return 0
   fi

elif hash "cygcheck" &>/dev/null; then
   if cygcheck "${_PACKAGE_NAME}" &>/dev/null; then
      [[ $_verbose ]] && echo "${_PACKAGE_NAME} is installed." || :
      return 0
   fi

elif hash "rpm" &>/dev/null; then
   if rpm -q openssh &>/dev/null; then
      [[ $_verbose ]] && echo "${_PACKAGE_NAME} is installed." || :
      return 0
   fi

else
   echo "$__fn: Error: Unable to determine installation status of ${_PACKAGE_NAME}. No supported package manager found." || :
   return 2
fi

[[ $_verbose ]] && echo "${_PACKAGE_NAME} is NOT installed." || :
return 1
####### pkg-installed ####### END
}
function __complete-pkg-installed() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help --verbose -v "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}pkg-installed -- ${BASH_FUNK_PREFIX:--}pkg-installed

function -test-all-os() {
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
function __impl-test-all-os() {
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

####### test-all-os ####### START
${BASH_FUNK_PREFIX:--}command-exists --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}pkg-installed --selftest && echo || return 1
####### test-all-os ####### END
}
function __complete-test-all-os() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-all-os -- ${BASH_FUNK_PREFIX:--}test-all-os


function -help-os() {
   local p="\033[1m${BASH_FUNK_PREFIX:--}"
   echo -e "${p}command-exists COMMAND\033[0m  -  Checks if the given program or function is available."
   echo -e "${p}pkg-installed PACKAGE_NAME\033[0m  -  Determines if the given software package is installed."
   echo -e "${p}test-all-os\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."
}
__BASH_FUNK_FUNCS+=( command-exists pkg-installed test-all-os )
