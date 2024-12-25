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
. "${LIBS_HESTIA}/HestiaKERNEL/Test/Codes.sh"




HestiaKERNEL_Exec_Test_Case() {
        #___filepath="$1"
        #___report_only_failed="$2"


        # validate input
        if [ "$1" = "" ]; then
                return $HestiaKERNEL_TEST_FAILED
        fi

        if [ ! -f "$1" ]; then
                return $HestiaKERNEL_TEST_FAILED
        fi

        if [ ! -x "$1" ]; then
                return $HestiaKERNEL_TEST_FAILED
        fi


        # execute
        ___output="$(2>&1 /bin/sh "$1")"
        if [ $? -eq 0 ]; then
                if [ "$2" = "" ]; then
                        1>&2 printf -- "%s\n" "$___output"
                fi
                return $HestiaKERNEL_TEST_PASSED
        fi
        1>&2 printf -- "%s\n" "$___output"


        # report status
        return $HestiaKERNEL_TEST_FAILED
}
