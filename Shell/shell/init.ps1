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
foreach ($___line in @(
        "${env:DIR_WORKSPACE}\libraries\HestiaKERNEL\Unicode\Init.ps1"
        "${env:DIR_WORKSPACE}\libraries\HestiaKERNEL\FS\Get_Files.ps1"
)) {
        if (-not (Test-Path $___line)) {
                $null = Write-Host "[ ERROR ] Missing '${___line}'"
                return 1
        }

        $null = . $___line
}




# re-create temp directory
$null = Remove-Item -Recurse -Force -Path ${env:DIR_TEMP} -ErrorAction SilentlyContinue
$null = New-Item -Path ${env:DIR_TEMP} -ItemType Directory -Force




# source all init scripts if available
if (Test-Path -Path "${env:DIR_WORKSPACE}\init" -PathType Container) {
        foreach ($___script in $(HestiaKERNEL-FS-Get-Files "${env:DIR_WORKSPACE}\init" ".ps1")) {
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
