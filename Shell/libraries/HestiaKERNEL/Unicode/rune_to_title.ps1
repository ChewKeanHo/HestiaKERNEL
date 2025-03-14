# Copyright 2024 HestiaKERNEL Authors
#
#
# Licensed under (Holloway) Chew, Kean Ho’s Liberal License (the "License").
# You must comply with the license to use the content. Get the License at:
#
#                 https://doi.org/10.5281/zenodo.13770769
#
# You MUST ensure any interaction with the content STRICTLY COMPLIES with
# the permissions and limitations set forth in the license.

# WARNING - Autogenerated script from 'HestiaKERNEL/src/unicode/data-parser.sh'.
#           DO NOT EDIT MANUALLY!
. "${env:LIBS_HESTIA}\HestiaKERNEL\Unicode\rune_to_lower.ps1"
. "${env:LIBS_HESTIA}\HestiaKERNEL\Unicode\rune_to_upper.ps1"




function hestiakernel-rune-to-title {
        param (
                [uint32]$___char_decimal,
                [uint32]$___next_decimal,
                [uint32]$___third_decimal,
                [string]$___locale
        )


        # validate input
        if ($___char_decimal -eq "") {
                # ERROR - bad input
                return ""
        }


        # language sensitive special cases
        switch -Wildcard ($___locale) {
        { $_ -in "az*", "tr*" } {
                # Turkish & Azerbaijani
                switch ($___char_decimal) {
                0x0049 {
                        switch ($___next_decimal) {
                        0x0307 {
                                if ($___to_title -ne "") {
                                        return "[2]73, 775"
                                } else {
                                        return "[2]105"
                                }
                        } default {
                                if ($___to_title -ne "") {
                                        return "[1]73"
                                } else {
                                        return "[1]305"
                                }
                        }}
                } { $_ -in 0x0069, 0x0130 } {
                        if ($___to_title -ne "") {
                                return "[1]304"
                        } else {
                                return "[1]105"
                        }
                }}
        } "lt*" {
                # Lithuanian
                switch ($___char_decimal) {
                0x0049 {
                        if ($___to_title -ne "") {
                                return "[1]73"
                        } else {
                                return "[1]105, 775"
                        }
                } 0x004A {
                        if ($___to_title -ne "") {
                                return "[1]74"
                        } else {
                                return "[1]106, 775"
                        }
                } 0x0069 {
                        switch ($___next_decimal) {
                        0x0307 {
                                switch ($___third_decimal) {
                                0x0300 {
                                        if ($___to_title -ne "") {
                                                return "[3]204"
                                        } else {
                                                return "[3]105, 775, 768"
                                        }
                                } 0x0301 {
                                        if ($___to_title -ne "") {
                                                return "[3]205"
                                        } else {
                                                return "[3]105, 775, 769"
                                        }
                                } 0x0303 {
                                        if ($___to_title -ne "") {
                                                return "[3]296"
                                        } else {
                                                return "[3]105, 775, 771"
                                        }
                                } default {
                                        if ($___to_title -ne "") {
                                                return "[2]73"
                                        } else {
                                                return "[2]105, 775 "
                                        }
                                }}
                        }}
                } 0x006A {
                        switch ($___next_decimal) {
                        0x0307 {
                                if ($___to_title -ne "") {
                                        return "[2]74"
                                } else {
                                        return "[2]106, 775"
                                }
                        }}
                } 0x00CC {
                        if ($___to_title -ne "") {
                                return "[1]204"
                        } else {
                                return "[1]105, 775, 768"
                        }
                } 0x00CD {
                        if ($___to_title -ne "") {
                                return "[1]205"
                        } else {
                                return "[1]105, 775, 769"
                        }
                } 0x0128 {
                        if ($___to_title -ne "") {
                                return "[1]296"
                        } else {
                                return "[1]105, 775, 771, "
                        }
                } 0x012E {
                        if ($___to_title -ne "") {
                                return "[1]302"
                        } else {
                                return "[1]303, 775"
                        }
                } 0x012F {
                        switch ($___next_decimal) {
                        0x0307 {
                                if ($___to_title -ne "") {
                                        return "[2]302"
                                } else {
                                        return "[2]303, 775"
                                }
                        }}
                } 0x0307 {
                        return "[1]"
                }}
        }}


        # language insensitive special cases
        switch ($___char_decimal) {
        "powershell-language-adjusting-first-case" {
                # just to make the first case consistent with others (as in
                # programming languages) without breaking the parser just for
                # PowerShell specific requirement.
        } 0x0041 {
                switch ($___next_decimal) {
                0x02BE {
                }}
        } 0x0046 {
                switch ($___next_decimal) {
                0x0046 {
                        switch ($___third_decimal) {
                        0x0049 {
                                if ($___to_title -ne "") {
                                        return "[3]70, 102, 105"
                                } else {
                                        return "[3]64259"
                                }
                        } 0x004C {
                                if ($___to_title -ne "") {
                                        return "[3]70, 102, 108"
                                } else {
                                        return "[3]64260"
                                }
                        } default {
                                if ($___to_title -ne "") {
                                        return "[2]70, 102"
                                } else {
                                        return "[2]64256"
                                }
                        }}
                } 0x0049 {
                        if ($___to_title -ne "") {
                                return "[2]70, 105"
                        } else {
                                return "[2]64257"
                        }
                } 0x004C {
                        if ($___to_title -ne "") {
                                return "[2]70, 108"
                        } else {
                                return "[2]64258"
                        }
                } 0x0066 {
                        switch ($___third_decimal) {
                        0x0069 {
                        } 0x006C {
                        } default {
                        }}
                } 0x0069 {
                } 0x006C {
                }}
        } 0x0048 {
                switch ($___next_decimal) {
                0x0331 {
                }}
        } 0x004A {
                switch ($___next_decimal) {
                0x030C {
                }}
        } 0x0053 {
                switch ($___next_decimal) {
                0x0053 {
                        if ($___to_title -ne "") {
                                return "[2]83, 115"
                        } else {
                                return "[2]223"
                        }
                } 0x0054 {
                        if ($___to_title -ne "") {
                                return "[2]83, 116"
                        } else {
                                return "[2]64262"
                        }
                } 0x0073 {
                } 0x0074 {
                }}
        } 0x0054 {
                switch ($___next_decimal) {
                0x0308 {
                }}
        } 0x0057 {
                switch ($___next_decimal) {
                0x030A {
                }}
        } 0x0059 {
                switch ($___next_decimal) {
                0x030A {
                }}
        } 0x0069 {
                switch ($___next_decimal) {
                0x0307 {
                        if ($___to_title -ne "") {
                                return "[2]304"
                        } else {
                                return "[2]105, 775"
                        }
                }}
        } 0x00DF {
                if ($___to_title -ne "") {
                        return "[1]83, 115"
                } else {
                        return "[1]223"
                }
        } 0x0130 {
        } 0x0149 {
                if ($___to_title -ne "") {
                        return "[1]700, 78"
                } else {
                        return "[1]329"
                }
        } 0x01F0 {
                if ($___to_title -ne "") {
                        return "[1]74, 780"
                } else {
                        return "[1]496"
                }
        } 0x02BC {
                switch ($___next_decimal) {
                0x004E {
                }}
        } 0x0386 {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]902, 837"
                        } else {
                                return "[2]8116"
                        }
                }}
        } 0x0389 {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]905, 837"
                        } else {
                                return "[2]8132"
                        }
                }}
        } 0x038F {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]911, 837"
                        } else {
                                return "[2]8180"
                        }
                }}
        } 0x0390 {
                if ($___to_title -ne "") {
                        return "[1]921, 776, 769"
                } else {
                        return "[1]912"
                }
        } 0x0391 {
                switch ($___next_decimal) {
                0x0342 {
                        switch ($___third_decimal) {
                        0x0345 {
                        } 0x0399 {
                                if ($___to_title -ne "") {
                                        return "[3]913, 834, 837"
                                } else {
                                        return "[3]8119"
                                }
                        } default {
                        }}
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8124"
                        } else {
                                return "[2]8115"
                        }
                }}
        } 0x0397 {
                switch ($___next_decimal) {
                0x0342 {
                        switch ($___third_decimal) {
                        0x0345 {
                        } 0x0399 {
                                if ($___to_title -ne "") {
                                        return "[3]919, 834, 837"
                                } else {
                                        return "[3]8135"
                                }
                        } default {
                        }}
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8140"
                        } else {
                                return "[2]8131"
                        }
                }}
        } 0x0399 {
                switch ($___next_decimal) {
                0x0308 {
                        switch ($___third_decimal) {
                        0x0300 {
                        } 0x0301 {
                        } 0x0342 {
                        }}
                } 0x0342 {
                }}
        } 0x03A1 {
                switch ($___next_decimal) {
                0x0313 {
                }}
        } 0x03A3 {
        } 0x03A5 {
                switch ($___next_decimal) {
                0x0308 {
                        switch ($___third_decimal) {
                        0x0300 {
                        } 0x0301 {
                        } 0x0342 {
                        }}
                } 0x0313 {
                        switch ($___third_decimal) {
                        0x0300 {
                        } 0x0301 {
                        } 0x0342 {
                        } default {
                        }}
                } 0x0342 {
                }}
        } 0x03A9 {
                switch ($___next_decimal) {
                0x0342 {
                        switch ($___third_decimal) {
                        0x0345 {
                        } 0x0399 {
                                if ($___to_title -ne "") {
                                        return "[3]937, 834, 837"
                                } else {
                                        return "[3]8183"
                                }
                        } default {
                        }}
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8188"
                        } else {
                                return "[2]8179"
                        }
                }}
        } 0x03B0 {
                if ($___to_title -ne "") {
                        return "[1]933, 776, 769"
                } else {
                        return "[1]944"
                }
        } 0x03C2 {
                if ($___to_title -ne "") {
                        return "[1]931"
                } else {
                        return "[1]962"
                }
        } 0x0535 {
                switch ($___next_decimal) {
                0x0552 {
                        if ($___to_title -ne "") {
                                return "[2]1333, 1410"
                        } else {
                                return "[2]1415"
                        }
                } 0x0582 {
                }}
        } 0x0544 {
                switch ($___next_decimal) {
                0x0535 {
                        if ($___to_title -ne "") {
                                return "[2]1348, 1381"
                        } else {
                                return "[2]64276"
                        }
                } 0x053B {
                        if ($___to_title -ne "") {
                                return "[2]1348, 1387"
                        } else {
                                return "[2]64277"
                        }
                } 0x053D {
                        if ($___to_title -ne "") {
                                return "[2]1348, 1389"
                        } else {
                                return "[2]64279"
                        }
                } 0x0546 {
                        if ($___to_title -ne "") {
                                return "[2]1348, 1398"
                        } else {
                                return "[2]64275"
                        }
                } 0x0565 {
                } 0x056B {
                } 0x056D {
                } 0x0576 {
                }}
        } 0x054E {
                switch ($___next_decimal) {
                0x0546 {
                        if ($___to_title -ne "") {
                                return "[2]1358, 1398"
                        } else {
                                return "[2]64278"
                        }
                } 0x0576 {
                }}
        } 0x0587 {
                if ($___to_title -ne "") {
                        return "[1]1333, 1410"
                } else {
                        return "[1]1415"
                }
        } 0x1E96 {
                if ($___to_title -ne "") {
                        return "[1]72, 817"
                } else {
                        return "[1]7830"
                }
        } 0x1E97 {
                if ($___to_title -ne "") {
                        return "[1]84, 776"
                } else {
                        return "[1]7831"
                }
        } 0x1E98 {
                if ($___to_title -ne "") {
                        return "[1]87, 778"
                } else {
                        return "[1]7832"
                }
        } 0x1E99 {
                if ($___to_title -ne "") {
                        return "[1]89, 778"
                } else {
                        return "[1]7833"
                }
        } 0x1E9A {
                if ($___to_title -ne "") {
                        return "[1]65, 702"
                } else {
                        return "[1]7834"
                }
        } 0x1F08 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8072"
                        } else {
                                return "[2]8064"
                        }
                }}
        } 0x1F09 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8073"
                        } else {
                                return "[2]8065"
                        }
                }}
        } 0x1F0A {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8074"
                        } else {
                                return "[2]8066"
                        }
                }}
        } 0x1F0B {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8075"
                        } else {
                                return "[2]8067"
                        }
                }}
        } 0x1F0C {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8076"
                        } else {
                                return "[2]8068"
                        }
                }}
        } 0x1F0D {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8077"
                        } else {
                                return "[2]8069"
                        }
                }}
        } 0x1F0E {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8078"
                        } else {
                                return "[2]8070"
                        }
                }}
        } 0x1F0F {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8079"
                        } else {
                                return "[2]8071"
                        }
                }}
        } 0x1F28 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8088"
                        } else {
                                return "[2]8080"
                        }
                }}
        } 0x1F29 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8089"
                        } else {
                                return "[2]8081"
                        }
                }}
        } 0x1F2A {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8090"
                        } else {
                                return "[2]8082"
                        }
                }}
        } 0x1F2B {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8091"
                        } else {
                                return "[2]8083"
                        }
                }}
        } 0x1F2C {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8092"
                        } else {
                                return "[2]8084"
                        }
                }}
        } 0x1F2D {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8093"
                        } else {
                                return "[2]8085"
                        }
                }}
        } 0x1F2E {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8094"
                        } else {
                                return "[2]8086"
                        }
                }}
        } 0x1F2F {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8095"
                        } else {
                                return "[2]8087"
                        }
                }}
        } 0x1F50 {
                if ($___to_title -ne "") {
                        return "[1]933, 787"
                } else {
                        return "[1]8016"
                }
        } 0x1F52 {
                if ($___to_title -ne "") {
                        return "[1]933, 787, 768"
                } else {
                        return "[1]8018"
                }
        } 0x1F54 {
                if ($___to_title -ne "") {
                        return "[1]933, 787, 769"
                } else {
                        return "[1]8020"
                }
        } 0x1F56 {
                if ($___to_title -ne "") {
                        return "[1]933, 787, 834"
                } else {
                        return "[1]8022"
                }
        } 0x1F68 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8104"
                        } else {
                                return "[2]8096"
                        }
                }}
        } 0x1F69 {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8105"
                        } else {
                                return "[2]8097"
                        }
                }}
        } 0x1F6A {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8106"
                        } else {
                                return "[2]8098"
                        }
                }}
        } 0x1F6B {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8107"
                        } else {
                                return "[2]8099"
                        }
                }}
        } 0x1F6C {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8108"
                        } else {
                                return "[2]8100"
                        }
                }}
        } 0x1F6D {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8109"
                        } else {
                                return "[2]8101"
                        }
                }}
        } 0x1F6E {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8110"
                        } else {
                                return "[2]8102"
                        }
                }}
        } 0x1F6F {
                switch ($___next_decimal) {
                0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8111"
                        } else {
                                return "[2]8103"
                        }
                }}
        } 0x1F80 {
                if ($___to_title -ne "") {
                        return "[1]8072"
                } else {
                        return "[1]8064"
                }
        } 0x1F81 {
                if ($___to_title -ne "") {
                        return "[1]8073"
                } else {
                        return "[1]8065"
                }
        } 0x1F82 {
                if ($___to_title -ne "") {
                        return "[1]8074"
                } else {
                        return "[1]8066"
                }
        } 0x1F83 {
                if ($___to_title -ne "") {
                        return "[1]8075"
                } else {
                        return "[1]8067"
                }
        } 0x1F84 {
                if ($___to_title -ne "") {
                        return "[1]8076"
                } else {
                        return "[1]8068"
                }
        } 0x1F85 {
                if ($___to_title -ne "") {
                        return "[1]8077"
                } else {
                        return "[1]8069"
                }
        } 0x1F86 {
                if ($___to_title -ne "") {
                        return "[1]8078"
                } else {
                        return "[1]8070"
                }
        } 0x1F87 {
                if ($___to_title -ne "") {
                        return "[1]8079"
                } else {
                        return "[1]8071"
                }
        } 0x1F88 {
        } 0x1F89 {
        } 0x1F8A {
        } 0x1F8B {
        } 0x1F8C {
        } 0x1F8D {
        } 0x1F8E {
        } 0x1F8F {
        } 0x1F90 {
                if ($___to_title -ne "") {
                        return "[1]8088"
                } else {
                        return "[1]8080"
                }
        } 0x1F91 {
                if ($___to_title -ne "") {
                        return "[1]8089"
                } else {
                        return "[1]8081"
                }
        } 0x1F92 {
                if ($___to_title -ne "") {
                        return "[1]8090"
                } else {
                        return "[1]8082"
                }
        } 0x1F93 {
                if ($___to_title -ne "") {
                        return "[1]8091"
                } else {
                        return "[1]8083"
                }
        } 0x1F94 {
                if ($___to_title -ne "") {
                        return "[1]8092"
                } else {
                        return "[1]8084"
                }
        } 0x1F95 {
                if ($___to_title -ne "") {
                        return "[1]8093"
                } else {
                        return "[1]8085"
                }
        } 0x1F96 {
                if ($___to_title -ne "") {
                        return "[1]8094"
                } else {
                        return "[1]8086"
                }
        } 0x1F97 {
                if ($___to_title -ne "") {
                        return "[1]8095"
                } else {
                        return "[1]8087"
                }
        } 0x1F98 {
        } 0x1F99 {
        } 0x1F9A {
        } 0x1F9B {
        } 0x1F9C {
        } 0x1F9D {
        } 0x1F9E {
        } 0x1F9F {
        } 0x1FA0 {
                if ($___to_title -ne "") {
                        return "[1]8104"
                } else {
                        return "[1]8096"
                }
        } 0x1FA1 {
                if ($___to_title -ne "") {
                        return "[1]8105"
                } else {
                        return "[1]8097"
                }
        } 0x1FA2 {
                if ($___to_title -ne "") {
                        return "[1]8106"
                } else {
                        return "[1]8098"
                }
        } 0x1FA3 {
                if ($___to_title -ne "") {
                        return "[1]8107"
                } else {
                        return "[1]8099"
                }
        } 0x1FA4 {
                if ($___to_title -ne "") {
                        return "[1]8108"
                } else {
                        return "[1]8100"
                }
        } 0x1FA5 {
                if ($___to_title -ne "") {
                        return "[1]8109"
                } else {
                        return "[1]8101"
                }
        } 0x1FA6 {
                if ($___to_title -ne "") {
                        return "[1]8110"
                } else {
                        return "[1]8102"
                }
        } 0x1FA7 {
                if ($___to_title -ne "") {
                        return "[1]8111"
                } else {
                        return "[1]8103"
                }
        } 0x1FA8 {
        } 0x1FA9 {
        } 0x1FAA {
        } 0x1FAB {
        } 0x1FAC {
        } 0x1FAD {
        } 0x1FAE {
        } 0x1FAF {
        } 0x1FB2 {
                if ($___to_title -ne "") {
                        return "[1]8122, 837"
                } else {
                        return "[1]8114"
                }
        } 0x1FB3 {
                if ($___to_title -ne "") {
                        return "[1]8124"
                } else {
                        return "[1]8115"
                }
        } 0x1FB4 {
                if ($___to_title -ne "") {
                        return "[1]902, 837"
                } else {
                        return "[1]8116"
                }
        } 0x1FB6 {
                if ($___to_title -ne "") {
                        return "[1]913, 834"
                } else {
                        return "[1]8118"
                }
        } 0x1FB7 {
                if ($___to_title -ne "") {
                        return "[1]913, 834, 837"
                } else {
                        return "[1]8119"
                }
        } 0x1FBA {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8122, 837"
                        } else {
                                return "[2]8114"
                        }
                }}
        } 0x1FBC {
        } 0x1FC2 {
                if ($___to_title -ne "") {
                        return "[1]8138, 837"
                } else {
                        return "[1]8130"
                }
        } 0x1FC3 {
                if ($___to_title -ne "") {
                        return "[1]8140"
                } else {
                        return "[1]8131"
                }
        } 0x1FC4 {
                if ($___to_title -ne "") {
                        return "[1]905, 837"
                } else {
                        return "[1]8132"
                }
        } 0x1FC6 {
                if ($___to_title -ne "") {
                        return "[1]919, 834"
                } else {
                        return "[1]8134"
                }
        } 0x1FC7 {
                if ($___to_title -ne "") {
                        return "[1]919, 834, 837"
                } else {
                        return "[1]8135"
                }
        } 0x1FCA {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8138, 837"
                        } else {
                                return "[2]8130"
                        }
                }}
        } 0x1FCC {
        } 0x1FD2 {
                if ($___to_title -ne "") {
                        return "[1]921, 776, 768"
                } else {
                        return "[1]8146"
                }
        } 0x1FD6 {
                if ($___to_title -ne "") {
                        return "[1]921, 834"
                } else {
                        return "[1]8150"
                }
        } 0x1FD7 {
                if ($___to_title -ne "") {
                        return "[1]921, 776, 834"
                } else {
                        return "[1]8151"
                }
        } 0x1FE2 {
                if ($___to_title -ne "") {
                        return "[1]933, 776, 768"
                } else {
                        return "[1]8162"
                }
        } 0x1FE4 {
                if ($___to_title -ne "") {
                        return "[1]929, 787"
                } else {
                        return "[1]8164"
                }
        } 0x1FE6 {
                if ($___to_title -ne "") {
                        return "[1]933, 834"
                } else {
                        return "[1]8166"
                }
        } 0x1FE7 {
                if ($___to_title -ne "") {
                        return "[1]933, 776, 834"
                } else {
                        return "[1]8167"
                }
        } 0x1FF2 {
                if ($___to_title -ne "") {
                        return "[1]8186, 837"
                } else {
                        return "[1]8178"
                }
        } 0x1FF3 {
                if ($___to_title -ne "") {
                        return "[1]8188"
                } else {
                        return "[1]8179"
                }
        } 0x1FF4 {
                if ($___to_title -ne "") {
                        return "[1]911, 837"
                } else {
                        return "[1]8180"
                }
        } 0x1FF6 {
                if ($___to_title -ne "") {
                        return "[1]937, 834"
                } else {
                        return "[1]8182"
                }
        } 0x1FF7 {
                if ($___to_title -ne "") {
                        return "[1]937, 834, 837"
                } else {
                        return "[1]8183"
                }
        } 0x1FFA {
                switch ($___next_decimal) {
                0x0345 {
                } 0x0399 {
                        if ($___to_title -ne "") {
                                return "[2]8186, 837"
                        } else {
                                return "[2]8178"
                        }
                }}
        } 0x1FFC {
        } 0xFB00 {
                if ($___to_title -ne "") {
                        return "[1]70, 102"
                } else {
                        return "[1]64256"
                }
        } 0xFB01 {
                if ($___to_title -ne "") {
                        return "[1]70, 105"
                } else {
                        return "[1]64257"
                }
        } 0xFB02 {
                if ($___to_title -ne "") {
                        return "[1]70, 108"
                } else {
                        return "[1]64258"
                }
        } 0xFB03 {
                if ($___to_title -ne "") {
                        return "[1]70, 102, 105"
                } else {
                        return "[1]64259"
                }
        } 0xFB04 {
                if ($___to_title -ne "") {
                        return "[1]70, 102, 108"
                } else {
                        return "[1]64260"
                }
        } 0xFB06 {
                if ($___to_title -ne "") {
                        return "[1]83, 116"
                } else {
                        return "[1]64262"
                }
        } 0xFB13 {
                if ($___to_title -ne "") {
                        return "[1]1348, 1398"
                } else {
                        return "[1]64275"
                }
        } 0xFB14 {
                if ($___to_title -ne "") {
                        return "[1]1348, 1381"
                } else {
                        return "[1]64276"
                }
        } 0xFB15 {
                if ($___to_title -ne "") {
                        return "[1]1348, 1387"
                } else {
                        return "[1]64277"
                }
        } 0xFB16 {
                if ($___to_title -ne "") {
                        return "[1]1358, 1398"
                } else {
                        return "[1]64278"
                }
        } 0xFB17 {
                if ($___to_title -ne "") {
                        return "[1]1348, 1389"
                } else {
                        return "[1]64279"
                }
        }}


        # switching non-special 1:1 casing now
        if ($___to_title -ne "") {
                return hestiakernel-rune-to-upper `
                        $___char_decimal `
                        $___next_decimal `
                        $___third_decimal `
                        $___prev_decimal `
                        $___locale
        }

        return hestiakernel-rune-to-lower `
                $___char_decimal `
                $___next_decimal `
                $___third_decimal `
                $___prev_decimal `
                $___locale
}
