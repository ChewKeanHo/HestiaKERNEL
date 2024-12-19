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




# NOTICE: this is a source-based function where you source this entire source
#         codes and obtain its side-effect into your session
if [ "$LANG" = "" ]; then
        export LANG="en_US.UTF-8"
elif [ "${LANG%".UTF-8"}" = "$LANG" ]; then
        export LANG="${LANG%#*}.UTF-8"
fi

export LC_ALL="${LANG}"
export PYTHONIOENCODING="UTF-8"
