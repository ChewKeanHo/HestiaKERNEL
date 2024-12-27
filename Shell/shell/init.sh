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




# import required libraries
___old_IFS="$IFS"
while IFS="" read -r ___line || [ -n "$___line" ]; do
        if [ ! -f "$___line" ]; then
                1>&2 printf -- "[ ERROR ] Missing '${___line}'\n"
                return 1
        fi

        . "$___line"
done <<EOF
${LIBS_HESTIA}/HestiaKERNEL/Unicode/Init.sh
${LIBS_HESTIA}/HestiaKERNEL/FS/Get_Files.sh
EOF
IFS="$___old_IFS" && unset ___old_IFS




# re-create temp directory
rm -rf "$DIR_TEMP" &> /dev/null
mkdir -p "$DIR_TEMP"




# source all init scripts if available
if [ -d "${DIR_WORKSPACE}/init" ]; then
        for ___script in $(HestiaKERNEL_FS_Get_Files "${DIR_WORKSPACE}/init" ".sh"); do
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
