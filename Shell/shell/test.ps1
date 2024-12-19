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




# initialize workspace
if (-not (Test-Path -Path "$(Get-Location)\shell\init.ps1")) {
        $null = Write-Error "[ ERROR  ] Missing '.\shell\init.ps1'."
        exit 1
}

$___process = . "$(Get-Location)\shell\init.ps1"
if ($___process -ne 0) {
        exit 1
}




# faciliate test framework
${env:TEST_PASSED} = 0
${env:TEST_FAILED} = 1




# execute all test scripts
$null = Write-Host "[ INFO   ] BEGIN TESTS SUITE"
$___scripts_total = 0
$___scripts_passed = 0
if (Test-Path -Path "${env:DIR_WORKSPACE}\tests" -PathType Container) {
        foreach ($___script in $(Find-Files-Recursive "${env:DIR_WORKSPACE}\tests" ".ps1")) {
                $null = Write-Host "`n`n[ INFO   ] Executing '${___script}' ..."
                $___scripts_total += 1

                $___process = & {
                        $null = . $___script
                        if ($LASTEXITCODE -eq 0) {
                                return 0
                        }

                        return 1
                }

                $null = Write-Host "[ INFO   ] Return code: |${___process}|"
                if ($___process -ne 0) {
                        continue
                }


                $___scripts_passed += 1
        }
}


# report overall test report
$___scripts_failed = $___scripts_total - $___scripts_passed
$null = Write-Host @"
`n
[ INFO   ] TOTAL : ${___scripts_total}
[ INFO   ] PASSED: ${___scripts_passed}
[ INFO   ] FAILED: ${___scripts_failed}
"@

if ($___scripts_failed -ne 0) {
        return 1
}
return 0
