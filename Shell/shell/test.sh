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




# faciliate test framework
export TEST_PASSED=0
export TEST_FAILED=1




# execute all test scripts
Logf "[ INFO    ] BEGIN TESTS SUITE\n"
___scripts_total=0
___scripts_passed=0
if [ -d "${DIR_WORKSPACE}/tests" ]; then
        for ___script in $(Find_Files_Recursive "${DIR_WORKSPACE}/tests" ".sh"); do
                if [ ! -f "$___script" ]; then
                        continue
                fi

                1>&2 printf -- "\n\n[ INFO   ] Executing '${___script}' ...\n"
                ___scripts_total=$(($___scripts_total + 1))

                if [ ! -x "$___script" ]; then
                        1>&2 printf -- "[ ERROR  ] Not executable!\n"
                        continue
                fi
                $(. "$___script")
                ___process=$?

                1>&2 printf -- "[ INFO   ] Return Code: |%s|\n" "$___process"
                if [ $___process -ne 0 ]; then
                        continue
                fi

                ___scripts_passed=$(($___scripts_passed + 1))
        done
fi




# report overall test report
___scripts_failed=$(($___scripts_total - $___scripts_passed))
Logf "\n
[ INFO    ] TOTAL  : %b
[ INFO    ] PASSED : %b
[ INFO    ] FAILED : %b
" "$___scripts_total" "$___scripts_passed" "$___scripts_failed"

if [ $___scripts_total -ne $___scripts_passed ]; then
        return 1
fi

return 0
