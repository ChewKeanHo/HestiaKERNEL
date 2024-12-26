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
$null = Write-Host @"
TEST CASE  :
HestiaKERNEL-Is-File

DESCRIPTION:
Function can identify a proper directory path.

"@




$null = Write-Host "Checking LIBS_HESTIA pathing: (${env:LIBS_HESTIA})"
if ("${env:LIBS_HESTIA}" -eq "") {
        $null = Write-Host "[ FAILED ] variable undefined!`n"
        exit 1
}




$___target = "${env:LIBS_HESTIA}\HestiaKERNEL\FS\Is_File.ps1"
$null = Write-Host "Checking Library file (${___target})..."
if (-not (Test-Path -Path $___target)) {
        $null = Write-Host "[ FAILED ] missing file!`n"
        exit 1
}




$null = Write-Host "Import function library..."
$null = . $___target
if (-not (Get-Command 'HestiaKERNEL-Is-File-FS' -errorAction SilentlyContinue)) {
        $null = Write-Host "[ FAILED ] error on import!`n"
        exit 1
}




$___input = "${env:LIBS_HESTIA}\HestiaKERNEL"
$___expect = 0
$___output = HestiaKERNEL-Is-File-FS $___input
$null = Write-Host "Given input  :`n|${___input}|`n"
$null = Write-Host "Given expect :`n|not ${___expect}|`n"
$null = Write-Host "Got Output   :`n|${___output}|`n"




# assert result
if ("${___output}" -ne "${___expect}") {
        $null = Write-Host "[ PASSED ]"
        exit 0
}
$null = Write-Host "[ FAILED ] unexpected/inconsistent output!"
exit 1
