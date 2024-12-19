# Copyright 2024 (Holloway) Chew, Kean Ho <hello@hollowaykeanho.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy
# of the License at:
#               http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
. "${env:LIBS_AUTOMATACI}\services\io\os.ps1"
. "${env:LIBS_AUTOMATACI}\services\io\fs.ps1"
. "${env:LIBS_AUTOMATACI}\services\i18n\translations.ps1"
. "${env:LIBS_AUTOMATACI}\services\compilers\node.ps1"




# initialize
if (-not (Test-Path -Path $env:PROJECT_PATH_ROOT)) {
	Write-Error "[ ERROR ] - Please run from automataCI\ci.sh.ps1 instead!`n"
	return
}




function RELEASE-Run-NPM {
	param(
		[string]$__target
	)


	# validate input
	$___process = NODE-NPM-Is-Valid "${__target}"
	if ($___process -ne 0) {
		return 0
	}

	if ($(STRINGS-Is-Empty "${env:PROJECT_NODE}") -eq 0) {
		return 0 # disabled explicitly
	}

	$null = I18N-Activate-Environment
	$___process = NODE-Activate-Local-Environment
	if ($___process -ne 0) {
		$null = I18N-Activate-Failed
		return 1
	}


	# execute
	$null = I18N-Publish "NPM"
	if ($(OS-Is-Run-Simulated) -ne 0) {
		$null = I18N-Check-Login "NPM"
		$___process = NODE-NPM-Check-Login
		if ($___process -ne 0) {
			$null = I18N-Publish-Failed
			return 1
		}

		$___process = NODE-NPM-Publish "${__target}"
		if ($___process -ne 0) {
			$null = I18N-Publish-Failed
			return 1
		}
	} else {
		# always simulate in case of error or mishaps before any point of no return
		$null = I18N-Simulate-Publish "NPM"
	}


	# report status
	return 0
}
