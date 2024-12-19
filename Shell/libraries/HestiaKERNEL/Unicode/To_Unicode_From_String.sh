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
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/To_Unicode_From_UTF8.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/Unicode.sh"




HestiaKERNEL_To_Unicode_From_String() {
        #___string="$1"


        # validate input
        if [ "$1" = "" ]; then
                printf -- ""
                return $HestiaKERNEL_ERROR_DATA_EMPTY
        fi


        # execute
        ## POSIX Shell does not handle any character beyond Latin-1 script.
        ## Hence, most of its string operation only works for ASCII character
        ## (<127). While it's not a problem for BASH; it is for
        ## non-BASH environment. Hence, manual implementations are required.
        ___converted=""
        ___content="$1"
        while [ ! "$___content" = "" ]; do
                ___char="${___content%"${___content#?}"}"
                ___content="${___content#${___char}}"
                ___codepoint="$(printf -- "%d" "'${___char}")"

                if [ $___codepoint -lt 0 ]; then
                        ___codepoint=""

                        if [ "$LANG" = "" ] && [ "$LC_ALL" = "" ]; then
                                : # unknown language & encoder
                        elif [ ! "$(type -t od)" = "" ]; then
                                # using od byte processor
                                ___data="$(printf -- "%s" "$___char" | od -A n -t uC)"

                                ___bytes=""
                                while [ ! "$___data" = "" ]; do
                                        ___byte="${___data##* }"
                                        ___data="${___data%" $___byte"}"
                                        if [ ! "$___byte" = "" ]; then
                                                ___bytes="${___byte}, ${___bytes}"
                                                continue
                                        fi
                                done
                                ___bytes="${___bytes%, }"

                                if [ ! "${LANG%".UTF-8"}" = "$LANG" ] ||
                                        [ ! "${LC_ALL%".UTF-8"}" = "$LC_ALL" ]; then
                                        # encoder is UTF-8
                                        ___codepoint="$(HestiaKERNEL_To_Unicode_From_UTF8 "$___bytes")"
                                fi
                        fi

                        if [ "$___codepoint" = "" ]; then
                                # unknown encoder - replace with '?'
                                ___codepoint=63
                        fi
                fi

                ___converted="${___converted}${___codepoint}, "
        done
        printf -- "%s" "${___converted%, }"


        # report status
        return $HestiaKERNEL_ERROR_OK
}
