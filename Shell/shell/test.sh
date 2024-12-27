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
if [ ! -f "${PWD}/shell/init.sh" ]; then
        1>&2 printf -- "[ ERROR  ] Missing './shell/init.sh'.\n"
        return 1
fi

. "${PWD}/shell/init.sh"
if [ $? -ne 0 ]; then
        return 1
fi




# import required libraries
___old_IFS="$IFS"
while IFS="" read -r ___line || [ -n "$___line" ]; do
        1>&2 printf -- "Importing '${___line}' ...\n"
        if [ ! -f "$___line" ]; then
                1>&2 printf -- "[ ERROR ] Missing library.\n"
                return 1
        fi

        . "$___line"
done <<EOF
${LIBS_HESTIA}/HestiaKERNEL/Unicode/Init.sh
${LIBS_HESTIA}/HestiaKERNEL/FS/Get_Files.sh
${LIBS_HESTIA}/HestiaKERNEL/Test/Codes.sh
${LIBS_HESTIA}/HestiaKERNEL/Test/Exec_Test_Case.sh
EOF
IFS="$___old_IFS" && unset ___old_IFS




# execute all test scripts
___scripts_total=0
___scripts_passed=0
___only_failed="" # value: 'true' (string)
if [ -d "${DIR_WORKSPACE}/tests" ]; then
        for ___script in $(HestiaKERNEL_FS_Get_Files "${DIR_WORKSPACE}/tests" ".sh" "-1"); do
                # increase total count
                ___scripts_total=$(($___scripts_total + 1))


                # execute
                if [ "$___only_failed" = "" ]; then
                        1>&2 printf -- "\n\n"
                fi
                1>&2 printf -- "[ INFO   ] Executing '${___script}' ...\n"

                HestiaKERNEL_Exec_Test_Case "$___script" "$___only_failed"
                if [ $? -ne $HestiaKERNEL_TEST_PASSED ]; then
                        continue
                fi


                # increase passed count
                ___scripts_passed=$(($___scripts_passed + 1))
        done
fi




# report overall test report
___scripts_failed=$(($___scripts_total - $___scripts_passed))
1>&2 printf -- "\n
[ RESULT ]
==========
TOTAL  : %b
PASSED : %b
FAILED : %b
==========
" "$___scripts_total" "$___scripts_passed" "$___scripts_failed"

if [ $___scripts_total -ne $___scripts_passed ]; then
        return 1
fi
return 0
