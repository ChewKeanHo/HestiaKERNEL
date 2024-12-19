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
# initialize workspace
if (-not (Test-Path -Path "$(Get-Location)\shell\test.ps1")) {
        $null = Write-Error "[ ERROR  ] Missing 'shell\test.ps1'."
        exit 1
}

$___process = . "$(Get-Location)\shell\test.ps1"
if ($___process -ne 0) {
        exit 1
}
exit 0
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
if [ ! -f "${PWD}/shell/test.sh" ]; then
        1>&2 printf -- "[ ERROR  ] Missing './shell/test.sh'.\n"
        exit 1
fi

. "${PWD}/shell/test.sh"
if [ $? -ne 0 ]; then
        exit 1
fi
exit 0
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit
#>
