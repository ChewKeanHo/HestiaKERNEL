#!/bin/sh
# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
#
#
# Licensed under (Holloway) Chew, Kean Ho’s Liberal License (the "License").
# You must comply with the license to use the content. Get the License at:
#
#                 https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.




# determine LIBS_HESTIA and other key directories' location
export DIR_WORKSPACE="$PWD"
if [ ! -d "${DIR_WORKSPACE}/libraries" ]; then
        1>&2 printf -- "[ ERROR ] Missing library in workspace. Are you inside?\n"
        return 1
fi
export LIBS_HESTIA="${DIR_WORKSPACE}/libraries"
export DIR_TEMP="${DIR_WORKSPACE}/temp"




# setup locale
if [ ! -f "${DIR_WORKSPACE}/libraries/HestiaKERNEL/Unicode/Init.sh" ]; then
        1>&2 printf -- "[ ERROR ] Missing './libraries/HestiaKERNEL/Unicode/Init.sh'\n"
        return 1
fi
. "${DIR_WORKSPACE}/libraries/HestiaKERNEL/Unicode/Init.sh"




# re-create temp directory
rm -rf "$DIR_TEMP" &> /dev/null
mkdir -p "$DIR_TEMP"




# facilitate recursive find function
Find_Files_Recursive() {
        #___directory="$1"
        #___filter="$2"


        # execute
        for ____item in "$1"/*; do
                if [ -d "$____item" ]; then
                        Find_Files_Recursive "$____item" "$2"
                elif [ -f "$____item" ]; then
                        ____filename="${____item##*/}"
                        if [ ! "${____filename##*"$2"}" = "$____filename" ]; then
                                printf -- "%s\n" "$____item"
                        fi
                fi
        done


        # report status
        return 0
}




# facilitate logging
Logf() {
        # execute
        1>&2 printf -- "$1" "${@:2}"


        # report status
        return 0
}




# source all init scripts if available
if [ -d "${DIR_WORKSPACE}/init" ]; then
        for ___script in $(Find_Files_Recursive "${DIR_WORKSPACE}/init" ".sh"); do
                if [ ! -f "$___script" ]; then
                        continue
                fi

                1>&2 printf -- "Sourcing ${___script} ...\n"
                . "$___script"
                if [ $? -ne 0 ]; then
                        1>&2 printf -- "[ ERROR ] init failed."
                        return 1
                fi
        done


        # report status
        return 0
fi




# report status
return 0
