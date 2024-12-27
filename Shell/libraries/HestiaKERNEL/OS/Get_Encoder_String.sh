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
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/Unicode.sh"




HestiaKERNEL_OS_Get_Encoder_String() {
        # execute
        case "${LANG##*.}" in
        "UTF-8")
                printf -- "%b" "$HestiaKERNEL_UTF8"
                return $HestiaKERNEL_ERROR_OK
                ;;
        "UTF-16")
                printf -- "%b" "$HestiaKERNEL_UTF16BE"
                return $HestiaKERNEL_ERROR_OK
                ;;
        "UTF-32")
                printf -- "%b" "$HestiaKERNEL_UTF32BE"
                return $HestiaKERNEL_ERROR_OK
                ;;
        *)
                ;;
        esac

        case "${LC_ALL##*.}" in
        "UTF-8")
                printf -- "%b" "$HestiaKERNEL_UTF8"
                return $HestiaKERNEL_ERROR_OK
                ;;
        "UTF-16")
                printf -- "%b" "$HestiaKERNEL_UTF16BE"
                return $HestiaKERNEL_ERROR_OK
                ;;
        "UTF-32")
                printf -- "%b" "$HestiaKERNEL_UTF32BE"
                return $HestiaKERNEL_ERROR_OK
                ;;
        *)
                printf -- "%b" "$HestiaKERNEL_UTF_UNKNOWN"
                return $HestiaKERNEL_ERROR_OK
                ;;
        esac
}
