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
if (-not (Test-Path -Path "$(Get-Location)\shell\init.ps1")) {
        $null = Write-Error "[ ERROR  ] Missing '.\shell\init.ps1'."
        exit 1
}

$___process = . "$(Get-Location)\shell\init.ps1"
if ($___process -ne 0) {
        exit 1
}




# import required libraries
. "${env:LIBS_HESTIA}\HestiaKERNEL\FS\Get_Files.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Test\Codes.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Test\Exec_Test_Case.ps1"




# execute all test scripts
$___scripts_total = 0
$___scripts_passed = 0
$___only_failed = "" # value: 'true' (string)
if (Test-Path -Path "${env:DIR_WORKSPACE}\tests" -PathType Container) {
        foreach (
                $___script
                in
                $(HestiaKERNEL-Get-Files-FS "${env:DIR_WORKSPACE}\tests" ".ps1" -1)
        ) {
                # increase total count
                $___scripts_total += 1


                # execute
                if ($___only_failed -eq "") {
                        $null = Write-Host "`n"
                }
                $null = Write-Host "[ INFO   ] Executing '${___script}' ..."

                $___process = HestiaKERNEL-Exec-Test-Case $___script $___only_failed
                if ($___process -ne ${env:HestiaKERNEL_TEST_PASSED}) {
                        continue
                }


                # increase passed count
                $___scripts_passed += 1
        }
}




# report overall test report
$___scripts_failed = $___scripts_total - $___scripts_passed
$null = Write-Host @"
`n
[ RESULT ]
==========
TOTAL : ${___scripts_total}
PASSED: ${___scripts_passed}
FAILED: ${___scripts_failed}
==========
"@

if ($___scripts_failed -ne 0) {
        return 1
}
return 0
