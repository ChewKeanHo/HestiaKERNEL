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
. "${LIBS_HESTIA}/HestiaKERNEL/Errors/Error_Codes.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/OS/Is_Command_Alias.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/OS/Is_Command_Available.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/OS/Is_Command_Builtin.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/OS/Is_Command_Function.sh"




HestiaKERNEL_OS_Is_Command_External() {
        #___command="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%d" $HestiaKERNEL_ERROR_DATA_MISSING
                return $HestiaKERNEL_ERROR_DATA_MISSING
        fi


        # execute
        if [ "$(HestiaKERNEL_OS_Is_Command_Alias "$1")" -ne $HestiaKERNEL_ERROR_OK ] &&
                [ "$(HestiaKERNEL_OS_Is_Command_Builtin "$1")" -ne $HestiaKERNEL_ERROR_OK ] &&
                [ "$(HestiaKERNEL_OS_Is_Command_Function "$1")" -ne $HestiaKERNEL_ERROR_OK ] &&
                [ "$(HestiaKERNEL_OS_Is_Command_Available "$1")" -eq $HestiaKERNEL_ERROR_OK ]; then
                printf -- "%d" $HestiaKERNEL_ERROR_OK
                return $HestiaKERNEL_ERROR_OK
        fi


        # report status
        printf -- "%d" $HestiaKERNEL_ERROR_DATA_MISSING
        return $HestiaKERNEL_ERROR_DATA_MISSING
}
