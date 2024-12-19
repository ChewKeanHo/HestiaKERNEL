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
$null = Logf "TEST CASE  : {0}`n" "HestiaKERNEL_Split_String"
$null = Logf "DESCRIPTION:`n{0}`n" @"
Function can split a proper string.
"@




$null = Logf "Checking LIBS_HESTIA pathing: (${0})`n" ${env:LIBS_HESTIA}
if (${env:LIBS_HESTIA} = "") {
        $null = Logf "[ FAILED ] variable undefined!`n`n"
        exit ${env:TEST_FAILED}
}




$___target = "${env:LIBS_HESTIA}\HestiaKERNEL\String\Split_Left_String.ps1"
$null = Logf "Checking Library file ({0})`n" $___target
if (-not (Test-Path -Path $___target)) {
        $null = Logf "[ FAILED ] missing file!`n`n"
        exit ${env:TEST_FAILED}
}




$null = Logf "Import function library...`n"
$___process = . $___target
if ($___process -ne 0) {
        $null = Logf "[ FAILED ] error on import!`n`n"
        exit ${env:TEST_FAILED}
}




$___input = "e你feeeff你你aergaegE你F"
$___target = "a"
$___expect = @(
        "e你feeeff你你",
        "erg",
        "egE你F"
)
$___output = HestiaKERNEL-Split-Left-String $___input $___target
Logf "Given sample:`n|{0}|`n" $___input
Logf "Given target:`n|{0}|`n" $___target
Logf "Given expect:`n|{0}|`n" $___expect
Logf "Given output:`n|{0}|`n" $___output




# assert result
if ($___output -eq $___expect) {
        Logf "[ PASSED ]`n"
        exit ${env:TEST_PASSED}
}
Logf "[ FAILED ] unexpected/inconsistent output!`n"
exit ${env:TEST_FAILED}
