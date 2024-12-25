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
. "${env:LIBS_HESTIA}\HestiaKERNEL\Test\Codes.sh"




function HestiaKERNEL-Exec-Test-Case {
        param (
                [string]$___filepath,
                [string]$___report_only_failed
        )


        # validate input
        if ($___filepath -eq "") {
                return ${env:HestiaKERNEL_TEST_FAILED}
        }

        if (-not (Test-Path -Path $___filepath -PathType Leaf)) {
                return ${env:HestiaKERNEL_TEST_FAILED}
        }


        # execute
        $___process = & {
                $___output = . $___script 2>&1
                if ($LASTEXITCODE -eq ${env:HestiaKERNEL_TEST_PASSED}) {
                        if ($___report_only_failed -eq "") {
                                $null = Write-Host "${___output}"
                        }

                        return ${env:HestiaKERNEL_TEST_PASSED}
                }

                $null = Write-Host "${___output}"
                return ${env:HestiaKERNEL_TEST_FAILED}
        }

        if ($___process -eq ${env:HestiaKERNEL_TEST_PASSED}) {
                return ${env:HestiaKERNEL_TEST_PASSED}
        }


        # report status
        return ${env:HestiaKERNEL_TEST_FAILED}
}
