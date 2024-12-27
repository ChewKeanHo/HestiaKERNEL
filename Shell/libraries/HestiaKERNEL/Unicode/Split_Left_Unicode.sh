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
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/Is_Unicode.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/Number/Is_Number.sh"




HestiaKERNEL_Split_Left_Unicode() {
        #___content_unicode="$1"
        #___target_unicode="$2"
        #___count="$3"
        #___ignore="$4"


        # validate input
        if [ $(HestiaKERNEL_Is_Unicode "$1") -ne $HestiaKERNEL_ERROR_OK ]; then
                printf -- "%s" "$1"
                return $HestiaKERNEL_ERROR_ENTITY_EMPTY
        fi

        if [ $(HestiaKERNEL_Is_Unicode "$2") -ne $HestiaKERNEL_ERROR_OK ]; then
                printf -- "%s" "$1"
                return $HestiaKERNEL_ERROR_DATA_EMPTY
        fi

        ___count=-1
        if [ $(HestiaKERNEL_NUMBER_Is_Number "$3") -eq $HestiaKERNEL_ERROR_OK ]; then
                ___count="$4"
        fi

        ___ignore=-1
        if [ $(HestiaKERNEL_NUMBER_Is_Number "$4") -eq $HestiaKERNEL_ERROR_OK ]; then
                ___ignore="$5"
        fi


        # execute
        ___list=""
        ___buffer=""
        ___content_unicode="$1"
        ___target_unicode="$2"
        ___is_splitting=0
        while [ ! "$___content_unicode" = "" ]; do
                # get current character
                ___current="${___content_unicode%%, *}"
                ___content_unicode="${___content_unicode#"$___current"}"
                if [ "${___content_unicode%"${___content_unicode#?}"}" = "," ]; then
                        ___content_unicode="${___content_unicode#, }"
                fi

                if [ $___is_splitting -ne 0 ]; then
                        ___list="${___list}${___current}, "
                        continue
                fi


                # get target character
                ___target="${___target_unicode%%, *}"
                ___target_unicode="${___target_unicode#"$___target"}"
                if [ "${___target_unicode%"${___target_unicode#?}"}" = "," ]; then
                        ___target_unicode="${___target_unicode#, }"
                fi


                # bail if mismatched
                if [ ! "$___current" = "$___target" ]; then
                        ___target_unicode="$2"

                        if [ ! "$___buffer" = "" ]; then
                                ___list="${___list}${___buffer%, }, "
                                ___buffer=""
                        fi

                        ___list="${___list}${___current}, "
                        continue
                fi


                # it's a match - save to buffer if the scan is still ongoing
                if [ ! "$___target_unicode" = "" ]; then
                        ___buffer="${___buffer}${___current}, "
                        continue
                fi


                # complete match - perform split
                if [ $___ignore -gt 0 ]; then
                        if [ ! "$___buffer" = "" ]; then
                                ___list="${___list}${___buffer%, }, "
                        fi

                        ___list="${___list}${___current}, "
                fi
                ___buffer=""
                ___target_unicode="$2"

                if [ $___ignore -gt 0 ]; then
                        ___ignore=$(($___ignore - 1))
                        continue
                fi

                ___list="${___list%, }\n"

                if [ $___count -gt 0 ]; then
                        ___count=$(($___count - 1))
                        if [ $___count -le 0 ]; then
                                ___is_splitting=1
                        fi
                fi
        done

        if [ ! "$___buffer" = "" ]; then
                ___list="${___list}${___buffer%, }, "
        fi


        # report status
        printf -- "%b" "${___list%, }"
        return $HestiaKERNEL_ERROR_OK
}
