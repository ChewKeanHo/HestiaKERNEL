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
. "${env:LIBS_HESTIA}\HestiaKERNEL\String\From_Unicode.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Unicode\Split_Left_Unicode.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Unicode\To_Unicode_From_String.ps1"




function HestiaKERNEL-STRING-Split-Left {
        param (
                [string]$___input,
                [string]$___target,
                [int32]$___count,
                [int32]$___ignore
        )


        # execute
        $___content = HestiaKERNEL-To-Unicode-From-String $___input
        $___chars = HestiaKERNEL-To-Unicode-From-String $___target
        $___content = HestiaKERNEL-Split-Left-Unicode $___content `
                                                        $___chars `
                                                        $___count `
                                                        $___ignore
        [System.Collections.Generic.List[string]]$___converted = @()
        foreach ($___line in $___content) {
                $___line = HestiaKERNEL-STRING-From-Unicode $___line
                $null = $___converted.Add($___line)
        }


        # report status
        return [string[]]$___converted
}
