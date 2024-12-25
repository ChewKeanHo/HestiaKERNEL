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
HestiaKERNEL-Split-String

DESCRIPTION:
Function can split a proper string when target is the same as sample.

"@




$null = Write-Host "Checking LIBS_HESTIA pathing: (${env:LIBS_HESTIA})"
if ("${env:LIBS_HESTIA}" -eq "") {
        $null = Write-Host "[ FAILED ] variable undefined!`n"
        exit 1
}




$___target = "${env:LIBS_HESTIA}\HestiaKERNEL\String\Split_Left_String.ps1"
$null = Write-Host "Checking Library file (${___target})..."
if (-not (Test-Path -Path $___target)) {
        $null = Write-Host "[ FAILED ] missing file!`n"
        exit 1
}




$null = Write-Host "Import function library..."
$null = . $___target
if (-not (Get-Command 'HestiaKERNEL-Split-Left-String' -errorAction SilentlyContinue)) {
        $null = Write-Host "[ FAILED ] error on import!`n"
        exit 1
}




$___input = "e你feeeff你你aerg aegE你F"
$___target = "e你feeeff你你aerg aegE你F"
$___expect = @()
$___expect_fallback = @()
$___output = HestiaKERNEL-Split-Left-String $___input $___target

$null = Write-Host "Given input :`n|${___input}|`n"
$null = Write-Host "Given target:`n|${___target}|`n"

$___verdict = 0

$___length = $___output.Length
if ($___expect.Length -gt $___length) {
        $___length = $___expect.Length
        $___verdict = 1
}

if ($___expect_fallback.Length -gt $___length) {
        $___length = $___expect_fallback.Length
        $___verdict = 1
}

$null = Write-Host "Got         :`n|index|expect|expect_fallback|output|"
for ($i = 0; $i -lt $___length; $i++) {
        try {
                $___char_output = $___output[$i]
        } catch {
                $___char_output = ""
        }

        try {
                $___char_expect = $___expect[$i]
        } catch {
                $___char_expect = ""
        }

        try {
                $___char_expect_fallback = $___expect_fallback[$i]
        } catch {
                $___char_expect_fallback = ""
        }

        if (
                ($___char_output -ne $___char_expect) -and
                ($___char_output -ne $___char_expect_fallback)
        ) {
                $___verdict = 1
        }

        $null = Write-Host "|${i}|${___char_expect}|${___char_expect_fallback}|${___char_output}|"
}




# assert result
if ($___verdict -eq 0) {
        $null = Write-Host "[ PASSED ]"
        exit 0
}
$null = Write-Host "[ FAILED ] unexpected/inconsistent output!"
exit 1
