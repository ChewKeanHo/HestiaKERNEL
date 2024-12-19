echo \" <<'RUN_AS_BATCH' >/dev/null ">NUL "\" \`" <#"
@ECHO OFF
REM LICENSE CLAUSES HERE
REM ----------------------------------------------------------------------------




REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
echo "[ ERROR ]   Use powershell.exe!"
exit /b 1
REM ############################################################################
REM # Windows BATCH Codes                                                      #
REM ############################################################################
RUN_AS_BATCH
#> | Out-Null




echo \" <<'RUN_AS_POWERSHELL' >/dev/null # " | Out-Null
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding `
                = [console]::OutputEncoding `
                = New-Object System.Text.UTF8Encoding




# execute
${env:DIR_WORKSPACE} = Get-Location



# determine LIBS_HESTIA location
if (-not (Test-Path -Path "${env:DIR_WORKSPACE}\libraries" -PathType Container)) {
        $null = Write-Error "[ ERROR ] Missing library in workspace. Are you inside?"
        return 1
}
${env:LIBS_HESTIA} = "${env:DIR_WORKSPACE}\libraries"
${env:DIR_TEMP} = "${env:DIR_WORKSPACE}\temp"


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
        return Get-ChildItem $___directory -Filter *$___filter
}


# facilitate logging
function Logf {
        param (
                [Parameter(Mandatory)]
                [string]___format,

                [Parameter(ValueFromRemainingArguments)]
                $___args
        )

        $null = Write-Host -NoNewLine ($___format -f @($___args))
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
}


# report status
return 0
################################################################################
# Windows POWERSHELL Codes                                                     #
################################################################################
exit
<#
RUN_AS_POWERSHELL




################################################################################
# Unix Main Codes                                                              #
################################################################################
# execute
export DIR_WORKSPACE="$PWD"


# determine LIBS_HESTIA location
if [ ! -d "${DIR_WORKSPACE}/libraries" ]; then
        1>&2 printf -- "[ ERROR ] Missing library in workspace. Are you inside?\n"
        return 1
fi
export LIBS_HESTIA="${DIR_WORKSPACE}/libraries"
export DIR_TEMP="${DIR_WORKSPACE}/temp"


# re-create temp directory
rm -rf "$DIR_TEMP" &> /dev/null
mkdir -p "$DIR_TEMP"


# facilitate recursive find function
Find_Files_Recursive() {
        #___directory="$1"
        #___filter="$2"


        # execute
        for ____item in "$1"/*; do
                if [ -d "$____item" ]; then
                        Find_Files_Recursive "$____item" "$2"
                elif [ -f "$____item" ]; then
                        ____filename="${____item##*/}"
                        if [ ! "${____filename##*"$2"}" = "$____filename" ]; then
                                printf -- "%s\n" "$____item"
                        fi
                fi
        done


        # report status
        return 0
}


# facilitate logging
Logf() {
        #___format="$1"
        #___args="${@:2}"

        1>&2 printf -- "$1" "${@:2}"
}


# faciliate test framework
export TEST_PASSED=0 TEST_FAILED=1


# source all init scripts if available
if [ -d "${DIR_WORKSPACE}/init" ]; then
        for ___script in $(Find_Files_Recursive "${DIR_WORKSPACE}/init" ".sh"); do
                if [ ! -f "$___script" ]; then
                        continue
                fi

                1>&2 printf -- "Sourcing ${___script} ...\n"
                . "$___script"
                if [ $? -ne 0 ]; then
                        1>&2 printf -- "[ ERROR ] init failed."
                        return 1
                fi
        done
fi


# report status
return 0
################################################################################
# Unix Main Codes                                                              #
################################################################################
exit $?
#>
