echo \" <<'RUN_AS_BATCH' >/dev/null ">NUL "\" \`" <#"
@ECHO OFF
REM LICENSE CLAUSES HERE
REM ----------------------------------------------------------------------------




REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
echo "[ ERROR ]   Use powershell.exe!"
exit /b 1
REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
RUN_AS_BATCH
#> | Out-Null




echo \" <<'RUN_AS_POWERSHELL' >/dev/null # " | Out-Null
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding




# initialize workspace
if (-not (Test-Path -Path "$(Get-Location)\Init.sh.ps1")) {
        $null = Write-Error "[ ERROR  ] Missing Init.sh.ps1. Are you inside the workspace?"
        exit 1
}

$___process = . "$(Get-Location)\Init.sh.ps1"
if ($___process -ne 0) {
        exit 1
}




# execute all test scripts
$null = Write-Host "[ INFO   ] BEGIN TESTS SUITE"
$___scripts_total = 0
$___scripts_passed = 0
if (Test-Path -Path "${env:DIR_WORKSPACE}\test" -PathType Container) {
        foreach ($___script in $(Find-Files-Recursive "${env:DIR_WORKSPACE}\test" ".ps1")) {
                $null = Write-Host "`n[ INFO   ] Executing '${___script}' ..."
                $___scripts_total += 1

                $___job = Start-Job -ScriptBlock {
                        param (
                                [string]$___filepath
                        )

                        try {
                                & $___filepath
                                if ($LASTEXITCODE -ne $null) {
                                        exit $LASTEXITCODE
                                }
                                exit 0
                        } catch {
                                exit 1
                        }
                } -ArgumentList $___script
                $null = Wait-Job $___job
                $___process = $___job.ChildJobs[0].JobStateInfo.Reason.ExitCode
                $null = Remove-Job $___job

                $null = Write-Host "[ INFO   ] Return code: ${___process}"
                if ($___process -ne 0) {
                        $null = Write-Host "[ ERROR  ] Test failed."
                        continue
                }

                $___scripts_passed += 1
        }
}


# report overall test report
$null = Logf @"
`n`n
[ INFO   ] TOTAL : {0}"
[ INFO   ] PASSED: {1}"
[ INFO   ] FAILED: {2}"

"@ $___scripts_total $___script_passed $($___scripts_total - $___scripts_passed)

if ($___scripts_total -ne $___scripts_passed) {
        $null = Logf "[ FAILED  ]`n"
        exit 1
} else {
        $null = Logf "[ SUCCESS ]`n"
        exit 0
}
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
exit
<#
RUN_AS_POWERSHELL




################################################################################
# Unix Main Codes                                                              #
################################################################################
# initialize workspace
if [ ! -f "${PWD}/Init.sh.ps1" ]; then
        1>&2 printf -- "[ ERROR  ] Missing Init.sh.ps1. Are you inside the workspace?\n"
        exit 1
fi
. "${PWD}/Init.sh.ps1"
if [ $? -ne 0 ]; then
        exit 1
fi




# execute all test scripts
Logf "[ INFO    ] BEGIN TESTS SUITE\n"
___scripts_total=0
___scripts_passed=0
if [ -d "${DIR_WORKSPACE}/test" ]; then
        for ___script in $(Find_Files_Recursive "${DIR_WORKSPACE}/test" ".sh"); do
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

                1>&2 printf -- "[ INFO   ] Return Code: %s\n" "$___process"
                if [ $___process -ne 0 ]; then
                        1>&2 printf -- "[ ERROR  ] Test failed."
                        continue
                fi

                ___scripts_passed=$(($___scripts_passed + 1))
        done
fi




# report overall test report
Logf "\n
[ INFO    ] TOTAL  : %b
[ INFO    ] PASSED : %b
[ INFO    ] FAILED : %b
" "$___scripts_total" "$___scripts_passed" "$(($___scripts_total - $___scripts_passed))"

if [ $___scripts_total -ne $___scripts_passed ]; then
        1>&2 printf -- "[ FAILED  ]\n"
        exit 1
else
        1>&2 printf -- "[ SUCCESS ]\n"
        exit 0
fi
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit
#>
