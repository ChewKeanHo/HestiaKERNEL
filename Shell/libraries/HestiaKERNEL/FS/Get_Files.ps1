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
. "${env:LIBS_HESTIA}\HestiaKERNEL\Error\Codes.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\FS\Is_Directory.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\FS\Is_File.ps1"




function HestiaKERNEL-Get-Files-FS {
        param (
                [string]$___directory,
                [string]$___filter,
                [int]$___recursive
        )


        # validate input
        if ($(HestiaKERNEL-Is-Directory-FS $___directory) -ne ${env:HestiaKERNEL_ERROR_OK}) {
                return [string[]]@()
        }


        # execute
        [System.Collections.Generic.List[string]]$___list = @()
        foreach ($____item in (Get-ChildItem $___directory)) {
                if ($(HestiaKERNEL-Is-Directory-FS $____item) -eq ${env:HestiaKERNEL_ERROR_OK}) {
                        if ($___recursive -eq 0) {
                                continue
                        } elseif ($___recursive -gt 0) {
                                $___results = HestiaKERNEL-Get-Files-FS $____item.FullName `
                                                                        $___filter `
                                                                        ($___recursive - 1)
                        } else {
                                $___results = HestiaKERNEL-Get-Files-FS $____item.FullName `
                                                                        $___filter `
                                                                        -1
                        }

                        foreach ($___result in $___results) {
                                $___list.Add($___result)
                        }
                } elseif ($(HestiaKERNEL-Is-File-FS $____item) -eq ${env:HestiaKERNEL_ERROR_OK}) {
                        if ($____item.Name -like "*${___filter}*") {
                                $___list.Add($____item.FullName)
                        }
                }
        }


        # report status
        return [string[]]$___list
}
