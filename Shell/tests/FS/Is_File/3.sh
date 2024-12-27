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
HestiaKERNEL_FS_Is_File

DESCRIPTION:
Function can operate with invalid path.
"




1>&2 printf --  "Checking LIBS_HESTIA pathing: (%s)\n" "$LIBS_HESTIA"
if [ "$LIBS_HESTIA" = "" ]; then
        1>&2 printf --  "[ FAILED ] variable undefined!\n"
        exit 1
fi




___target="${LIBS_HESTIA}/HestiaKERNEL/FS/Is_File.sh"
1>&2 printf --  "Checking Library file (%s)\n" "$___target"
if [ ! -f "$___target" ]; then
        1>&2 printf --  "[ FAILED ] missing file!\n"
        exit 1
fi




1>&2 printf --  "Import function library...\n"
. "$___target"
___target="$(type HestiaKERNEL_FS_Is_File)"
if [ ! "${___target##*not found}"  = "$___target" ]; then
        1>&2 printf --  "[ FAILED ] error on import!\n"
        exit 1
fi




___input="${LIBS_HESTIA}/HestiaKERNEL/FS/aregRWEGaegeagaeG"
___expect="0"
___output="$(HestiaKERNEL_FS_Is_File "$___input")"
___process=$?
1>&2 printf --  "Given input            :\n|%s|\n\n" "$___input"
1>&2 printf --  "Given expect           :\n|not %s|\n\n" "$___expect"
1>&2 printf --  "Given output           :\n|%s|\n\n" "$___output"
1>&2 printf --  "Given return code      :\n|%s|\n\n" "$___process"




# assert result
if [ ! "$___output" = "$___expect" ]; then
        1>&2 printf --  "[ PASSED ]\n"
        exit 0
fi
1>&2 printf --  "[ FAILED ] unexpected/inconsistent output!\n"
exit 1
