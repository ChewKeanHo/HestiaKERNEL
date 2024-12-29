#!/bin/sh
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
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/Split_Left_Unicode.sh"
. "${LIBS_HESTIA}/HestiaKERNEL/Unicode/To_Unicode_From_String.sh"




HestiaKERNEL_STRING_Split_Left() {
        #___input="$1"
        #___target="$2"
        #___count="$3"
        #___ignore="$4"


        # execute
        ___content="$(HestiaKERNEL_To_Unicode_From_String "$1")"
        ___chars="$(HestiaKERNEL_To_Unicode_From_String "$2")"
        ___content="$(HestiaKERNEL_Split_Left_Unicode "$___content" \
                                                        "$___chars" \
                                                        "$3" \
                                                        "$4"
        )"
        ## IMPORTANT NOTICE
        ## Due to shell script not having an array type and performance
        ## constraints, Hestia will convert the list and keeps them in unicode
        ## format for using new line ('\n') as an accurate separator between
        ## each entries in a long string.
        ##
        ## Hence, you need to loop through the list manually and call
        ## 'HestiaKERNEL_To_String_From_Unicode' function to decode your target
        ## of interest.
        ##
        ## Example:
        ## ---------------------------------------------------------------------
        ## . "${LIBS_HESTIA}/HestiaKERNEL/String/To_String_From_Unicode.sh"
        ##
        ## ___index=0
        ## ___target=""
        ## ___old_IFS="$IFS"
        ## while IFS='' read -r ___line || [ -n "$___line" ]; do
        ##      ___index=$(($___index + 1))
        ##
        ##      # example: we only want 3rd item (starts from 0)
        ##      if [ $___index -ne 2 ];
        ##              continue
        ##      fi
        ##
        ##      # convert the line back to actual string
        ##      ___target="$(HestiaKERNEL_To_String_From_Unicode "$___line")"
        ##      break
        ## done <<EOF
        ## ${your_process_list_variables}
        ## EOF
        ## IFS="$___old_IFS" && unset ___old_IFS
        ## ---------------------------------------------------------------------
        printf -- "%s" "$___content"


        # report status
        return $?
}
