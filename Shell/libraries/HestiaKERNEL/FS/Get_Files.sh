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
. "${LIBS_HESTIA}/HestiaKERNEL/FS/Is_Directory.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/FS/Is_File.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/Number/Is_Number.sh"




HestiaKERNEL_Get_Files_FS() {
        #___directory="$1"
        #___filter="$2"
        #___recursive="$3"


        # validate input
        if [ $(HestiaKERNEL_Is_Directory_FS "$1") -ne $HestiaKERNEL_ERROR_OK ]; then
                printf -- ""
                return $HestiaKERNEL_ERROR_ENTITY_INVALID
        fi


        # execute
        for ____item in "$1"/*; do
                if [ $(HestiaKERNEL_Is_Directory_FS "$____item") -eq $HestiaKERNEL_ERROR_OK ]; then
                        if [ $(HestiaKERNEL_Is_Number "$3") -ne $HestiaKERNEL_ERROR_OK ]; then
                                continue
                        fi

                        if [ $3 -eq 0 ]; then
                                continue
                        elif [ $3 -gt 0 ]; then
                                HestiaKERNEL_Get_Files_FS "$____item" "$2" "$(($3 - 1))"
                        else
                                HestiaKERNEL_Get_Files_FS "$____item" "$2" "$3"
                        fi
                elif [ $(HestiaKERNEL_Is_File_FS "$____item") -eq $HestiaKERNEL_ERROR_OK ]; then
                        ____filename="${____item##*/}"

                        if [ "$2" = "" ]; then
                                printf -- "%s\n" "$____item"
                        elif [ ! "${____filename##*"$2"}" = "$____filename" ]; then
                                printf -- "%s\n" "$____item"
                        fi
                fi
        done


        # report status
        return $HestiaKERNEL_ERROR_OK
}
