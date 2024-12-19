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




# determine LIBS_HESTIA and other key directories' location
${env:DIR_WORKSPACE} = Get-Location
if (-not (Test-Path -Path "${env:DIR_WORKSPACE}\libraries" -PathType Container)) {
        $null = Write-Error "[ ERROR ] Missing library in workspace. Are you inside?"
        return 1
}
${env:LIBS_HESTIA} = "${env:DIR_WORKSPACE}\libraries"
${env:DIR_TEMP} = "${env:DIR_WORKSPACE}\temp"




# setup locale
if (-not (Test-Path "${env:DIR_WORKSPACE}\libraries\HestiaKERNEL\Unicode\Init.ps1")) {
        $null = Write-Host "[ ERROR ] Missing '.\libraries\HestiaKERNEL\Unicode\Init.ps1'"
        return 1
}
. "${env:DIR_WORKSPACE}\libraries\HestiaKERNEL\Unicode\Init.ps1"




# re-create temp directory
$null = Remove-Item -Recurse -Force -Path ${env:DIR_TEMP} -ErrorAction SilentlyContinue
$null = New-Item -Path ${env:DIR_TEMP} -ItemType Directory -Force




# facilitate recursive find function
function Find-Files-Recursive {
        param (
                [string]$___directory,
                [string]$___filter
        )


        # execute
        [System.Collections.Generic.List[string]]$___list = @()
        foreach ($___item in (Get-ChildItem $___directory)) {
                if (Test-Path -Path $___item.FullName -PathType Container) {
                        $___results = Find-Files-Recursive $___item.FullName $___filter
                        foreach ($___result in $___results) {
                                $___list.Add($___result)
                        }
                } elseif (Test-Path -Path $___item.FullName -PathType Leaf) {
                        if ($___item.Name -like "*${___filter}*") {
                                $___list.Add($___item.FullName)
                        }
                }
        }


        # report status
        return [string[]]$___list
}




# source all init scripts if available
if (Test-Path -Path "${env:DIR_WORKSPACE}\init" -PathType Container) {
        foreach ($___script in $(Find-Files-Recursive "${env:DIR_WORKSPACE}\init" ".ps1")) {
                $null = Write-Host "Sourcing ${___script} ..."
                $___process = . $___script
                if ($___process -ne 0) {
                        $null = Write-Error "[ ERROR ] init failed."
                        return 1
                }
        }


        # report status
        return 0
}




# report status
return 0
