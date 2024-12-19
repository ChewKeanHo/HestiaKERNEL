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




# NOTICE: this is a source-based function where you source this entire source
#         codes and obtain its side-effect into your session
$___lang = [System.Threading.Thread]::CurrentThread.CurrentCulture
$___lang = $___lang.Name

$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$PSDefaultParameterValues['Set-Content:Encoding'] = 'utf8'

$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding $false

 ${env:PYTHONIOENCODING} = "UTF-8"
${env:LC_ALL} = ($___lang -replace '-', '_') + ".UTF-8"
