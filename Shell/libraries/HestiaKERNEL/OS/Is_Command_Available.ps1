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
. "${env:LIBS_HESTIA}\HestiaKERNEL\Error\Codes.ps1"




function HestiaKERNEL-OS-Is-Command-Available {
        param (
                [string]$___command
        )


        # validate input
        if ($___command -eq "") {
                return ${env:HestiaKERNEL_ERROR_DATA_MISSING}
        }


        # execute
        $___process = Get-Command $___command -ErrorAction SilentlyContinue
        if ($___process) {
                return ${env:HestiaKERNEL_ERROR_OK}
        }


        # report status
        return ${env:HestiaKERNEL_ERROR_DATA_MISSING}
}
