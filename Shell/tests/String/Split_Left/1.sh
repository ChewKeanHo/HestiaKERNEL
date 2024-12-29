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
1>&2 printf --  "%s\n" "\
TEST CASE  :
HestiaKERNEL_STRING_Split_Left

DESCRIPTION:
Function can split a proper string with non-ASCII character.
"




1>&2 printf --  "Checking LIBS_HESTIA pathing: (%s)\n" "$LIBS_HESTIA"
if [ "$LIBS_HESTIA" = "" ]; then
        1>&2 printf --  "[ FAILED ] variable undefined!\n"
        exit 1
fi




___target="${LIBS_HESTIA}/HestiaKERNEL/String/Split_Left.sh"
1>&2 printf --  "Checking Library file (%s)\n" "$___target"
if [ ! -f "$___target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi




1>&2 printf --  "Import function library...\n"
. "$___target"
___target="$(type HestiaKERNEL_STRING_Split_Left)"
if [ ! "${___target##*not found}"  = "$___target" ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




___input="e你feeeff你你aergaegE你F"
___target="你"
___expect="\
101
102, 101, 101, 101, 102, 102

97, 101, 114, 103, 97, 101, 103, 69
70"
___expect_fallback="\
101
102, 101, 101, 101, 102, 102

97, 101, 114, 103, 97, 101, 103, 69
70"
___output="$(HestiaKERNEL_STRING_Split_Left "$___input" "$___target")"
___process=$?
1>&2 printf --  "Given sample           :\n|%s|\n\n" "$___input"
1>&2 printf --  "Given target           :\n|%s|\n\n" "$___target"
1>&2 printf --  "Given expect           :\n|%s|\n\n" "$___expect"
1>&2 printf --  "Given expect (fallback):\n|%s|\n\n" "$___expect_fallback"
1>&2 printf --  "Given output           :\n|%s|\n\n" "$___output"
if [ $___process -ne 0 ]; then
        1>&2 printf --  "[ FAILED ] error on execution!\n"
        exit 1
fi




# assert result
if [ "$___output" = "$___expect" ] || [ "$___output" = "$___expect_fallback" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi
1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
