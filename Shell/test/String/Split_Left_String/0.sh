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
Logf "TEST CASE  : %s\n" "HestiaKERNEL_Split_String"
Logf "DESCRIPTION:\n%s\n" "\
Function can split a proper string.
"


Logf "Checking LIBS_HESTIA pathing: (%s)\n" "$LIBS_HESTIA"
if [ "$LIBS_HESTIA" = "" ]; then
        Logf "[ FAILED ] variable undefined!\n\n"
        exit $TEST_FAILED
fi


___target="${LIBS_HESTIA}/HestiaKERNEL/String/Split_Left_String.sh"
Logf "Checking Library file (%s)\n" "$___target"
if [ ! -f "$___target" ]; then
        Logf "[ FAILED ] missing file!\n\n"
        exit $TEST_FAILED
fi


Logf "Import function library...\n"
. "$___target"
if [ $? -ne 0 ]; then
        Logf "[ FAILED ] error on import!\n\n"
        exit $TEST_FAILED
fi


___input="e你feeeff你你aergaegE你F"
___target="a"
___expect="\
101, 20320, 102, 101, 101, 101, 102, 102, 20320, 20320
101, 114, 103
101, 103, 69, 20320, 70"
___expect_mac="\
101, 63, 102, 101, 101, 101, 102, 102, 63, 63
101, 114, 103
101, 103, 69, 63, 70"
___output="$(HestiaKERNEL_Split_Left_String "$___input" "$___target")"
___process=$?
Logf "Given sample:\n|%s|\n" "$___input"
Logf "Given target:\n|%s|\n" "$___target"
Logf "Given expect:\n|%s|\n" "$___expect"
Logf "Given output:\n|%s|\n" "$___output"
if [ $___process -ne 0 ]; then
        Logf "[ FAILED ] error on execution!\n\n"
        exit $TEST_FAILED
fi




# assert result
if [ "$___output" = "$___expect" ] || [ "$___output" = "$___expect_mac" ]; then
        Logf "[ PASSED ]\n"
        exit $TEST_PASSED
fi
Logf "[ FAILED ] unexpected/inconsistent output!\n"
exit $TEST_FAILED
