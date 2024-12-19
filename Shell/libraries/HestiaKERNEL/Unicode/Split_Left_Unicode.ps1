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
. "${env:LIBS_HESTIA}\HestiaKERNEL\Errors\Error_Codes.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Unicode\Is_Unicode.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Number\Is_Number.ps1"




function HestiaKERNEL-Split-Left-Unicode {
        param (
                [uint32[]]$___content_unicode,
                [uint32[]]$___target_unicode,
                [int32]$___count,
                [int32]$___ignore
        )


        # validate input
        if (
                ($(HestiaKERNEL-Is-Unicode $___content_unicode) -ne ${env:HestiaKERNEL_ERROR_OK}) -or
                ($(HestiaKERNEL-Is-Unicode $___target_unicode) -ne ${env:HestiaKERNEL_ERROR_OK})
        ) {
                return [uint32[][]]@($___content_unicode)
        }

        if (
                ("${___count}" -eq "") -or
                ($___count -le 0)
        ) {
                $___count = -1
        }

        if (
                ("${___ignore}" -eq "") -or
                ($___ignore -le 0)
        ) {
                $___ignore = -1
        }

        if ($___target_unicode.Length -gt $___content_unicode.Length) {
                return [uint32[][]]@($___content_unicode)
        }


        # execute
        [System.Collections.Generic.List[uint32[]]]$___list = @()
        [System.Collections.Generic.List[uint32]]$___converted = @()
        [System.Collections.Generic.List[uint32]]$___buffer = @()
        $___target_length = $___target_unicode.Length - 1
        $___target_index = 0
        $___is_splitting = 0
        for ($___index = 0; $___index -le $___content_unicode.Length - 1; $___index++) {
                # get current character
                $___current = $___content_unicode[$___index]

                if ($___is_splitting -ne 0) {
                        $___converted.Add($___current)
                        continue
                }


                # get target character
                $___target = $___target_unicode[$___target_index]
                $___target_index += 1


                # bail if mismatched
                if ($___current -ne $___target) {
                        $___target_index = 0

                        if ($___buffer.Length -gt 0) {
                                foreach ($___char in $___buffer) {
                                        $___converted.Add($___char)
                                }
                                [System.Collections.Generic.List[uint32]]$___buffer = @()
                        }

                        $null = $___converted.Add($___current)
                        $null = $___list.Add([uint32[]]$___converted)
                        [System.Collections.Generic.List[uint32]]$___converted = @()
                        continue
                }


                # it's a match - save to buffer if the scan is still ongoing
                if ($___target_index -le $___target_length) {
                        $___buffer.Add($___current)
                        continue
                }


                # complete match - perform split
                if ($___ignore -gt 0) {
                        foreach ($___char in $___buffer) {
                                $___converted.Add($___char)
                        }
                        $___converted.Add($___current)
                }
                [System.Collections.Generic.List[uint32]]$___buffer = @()
                $___target_index = 0

                if ($___ignore -gt 0) {
                        $___ignore -= 1
                        continue
                }

                $null = $___list.Add([uint32[]]$___converted)
                [System.Collections.Generic.List[uint32]]$___converted = @()

                if ($___count -gt 0) {
                        $___count -= 1
                        if ($___count -le 0) {
                                $___is_splitting = 1
                        }
                }
        }

        if ($___buffer.Length -gt 0) {
                foreach ($___char in $___buffer) {
                        $___converted.Add($___char)
                }
        }

        if ($___converted.Length -gt 0) {
                $null = $___list.Add([uint32[]]$___converted)
        }


        # report status
        return [uint32[][]]$___list
}
