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
. "${env:LIBS_HESTIA}\hestiaKERNEL\Error\Codes.ps1"




function HestiaKERNEL-Is-Directory-FS {
        param (
                [string]$___target
        )


        # validate input
        if ($___target -eq "") {
                return ${env:HestiaKERNEL_ERROR_DATA_EMPTY}
        }


        # execute
        if (Test-Path -PathType Container -Path $___target -ErrorAction SilentlyContinue) {
                return ${env:HestiaKERNEL_ERROR_OK}
        }


        # report status
        return ${env:HestiaKERNEL_ERROR_DATA_BAD}
}
