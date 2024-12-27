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
. "${LIBS_HESTIA}/HestiaKERNEL/Error/Codes.sh"




HestiaKERNEL_FS_Is_File() {
        #___target="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- "%d" "$HestiaKERNEL_ERROR_DATA_EMPTY"
                return $HestiaKERNEL_ERROR_DATA_EMPTY
        fi


        # execute
        if [ -f "$1" ]; then
                printf -- "%d" "$HestiaKERNEL_ERROR_OK"
                return $HestiaKERNEL_ERROR_OK
        fi


        # report status
        printf -- "%d" "$HestiaKERNEL_ERROR_DATA_BAD"
        return $HestiaKERNEL_ERROR_DATA_BAD
}
