#!/bin/bash

set -o errexit
set -o pipefail

# Description: term_text() bash script function outputs and 
# resizes and wrap text based on terminal window size.
# Supports formatting with line breaks. Add \n to text input.
# Supports text alignment: left, center, right
# Example borders: single, double, none, hash, asterisk
# Example color schemes: danger, success, warning, info

term_text() {

    # Get function arguments
    local cols=$(tput cols)
    local text_align="${1}"
    local border_style="${2}"
    local color_scheme="${3}"
    local text_input="${4}"

    # Padding left and right
    local padding="2"
    # Margin left and right
    local margin="2"
    # Border width column size
    local border_width="1"
    # Max banner/box size in terminal window
    local max_percent="80"

    if ! (( ${cols} % 2 == 0 )); then
        cols=$((${cols}-1))
    fi

    local max_size=$(((${cols}-(${margin}*2)-(${border_width}*2))*${max_percent}/100))
    
    if ! (( ${max_size} % 2 == 0 )); then
        max_size=$((${max_size}-1))
    fi

    local max_line_size="$((${max_size}-(${padding}*2)))"
    local offset=$(((${cols}-(${margin}*2)-(${border_width}*2)-${max_size})/2))

    # Colors
    local RESET=$(printf '\033[0m')
    local BOLD=$(printf '\033[1m')
    local BLACK=$(printf '\033[30m')
    local RED=$(printf '\033[31m')
    local GREEN=$(printf '\033[32m')
    local YELLOW=$(printf '\033[33m')
    local BLUE=$(printf '\033[34m')
    local CYAN=$(printf '\033[36m')
    local WHITE=$(printf '\033[37m')
    local BG_RED=$(printf '\033[41m')
    local BG_GREEN=$(printf '\033[42m')
    local BG_YELLOW=$(printf '\033[43m')
    local BG_CYAN=$(printf '\033[46m')   
    local BG_WHITE=$(printf '\033[47m')


    # Debug show padding margin etc. with chars/symbols
    local debug=false
    if [[ ${debug} == true ]]; then
        local offset_char="O"
        local margin_char="M"
        local padding_char="P"
        local text_padding_char="*"
    else
        local offset_char=" "
        local margin_char=" "
        local padding_char=" "
        local text_padding_char=" "
    fi 

    # Border styling
    if [[ "${border_style}" == *"none"* ]]; then
        local border_style_top=" "
        local border_style_top_left=" "
        local border_style_top_right=" "

        local border_style_left=" "
        local border_style_right=" "

        local border_style_bottom=" "
        local border_style_bottom_left=" "
        local border_style_bottom_right=" "
    elif [[ "${border_style}" == *"double"* ]]; then
        local border_style_top="═"
        local border_style_top_left="╔"
        local border_style_top_right="╗"

        local border_style_left="║"
        local border_style_right="║"

        local border_style_bottom="═"
        local border_style_bottom_left="╚"
        local border_style_bottom_right="╝"
    elif [[ "${border_style}" == *"single"* ]]; then
        local border_style_top="-"
        local border_style_top_left="+"
        local border_style_top_right="+"

        local border_style_left="|"
        local border_style_right="|"

        local border_style_bottom="-"
        local border_style_bottom_left="+"
        local border_style_bottom_right="+"
    elif [[ "${border_style}" == *"hash"* ]]; then
        local border_style_top="#"
        local border_style_top_left="#"
        local border_style_top_right="#"

        local border_style_left="#"
        local border_style_right="#"

        local border_style_bottom="#"
        local border_style_bottom_left="#"
        local border_style_bottom_right="#"
    elif [[ "${border_style}" == *"asterisk"* ]]; then
        local border_style_top="*"
        local border_style_top_left="*"
        local border_style_top_right="*"

        local border_style_left="*"
        local border_style_right="*"

        local border_style_bottom="*"
        local border_style_bottom_left="*"
        local border_style_bottom_right="*"
    fi

    if [[ "${color_scheme}" == *"none"* ]]; then
        local FG_COLOR=""
        local BG_COLOR=""
    elif [[ "${color_scheme}" == *"danger"* ]]; then
        local FG_COLOR="${WHITE}"
        local BG_COLOR="${BG_RED}"
    elif [[ "${color_scheme}" == *"success"* ]]; then
        local FG_COLOR="${BLACK}"
        local BG_COLOR="${BG_GREEN}"
    elif [[ "${color_scheme}" == *"warning"* ]]; then
        local FG_COLOR="${BLACK}"
        local BG_COLOR="${BG_YELLOW}"
    elif [[ "${color_scheme}" == *"info"* ]]; then
        local FG_COLOR="${BLACK}"
        local BG_COLOR="${BG_CYAN}"
    fi

    # Output border based on border_style argument
    border_top() {
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        echo -ne "${FG_COLOR}${BG_COLOR}${border_style_top_left}"
        for ((i=1; i<=((${max_size})); i++)); do echo -ne "${border_style_top}"; done
        echo -ne "${border_style_top_right}${RESET}"
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        echo
    }

    border_bottom() {
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        echo -ne "${FG_COLOR}${BG_COLOR}${border_style_bottom_left}"
        for ((i=1; i<=((${max_size})); i++)); do echo -ne "${border_style_bottom}"; done
        echo -ne "${border_style_bottom_right}${RESET}"
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        echo
    }

    border_left() {
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        echo -ne "${FG_COLOR}${BG_COLOR}${border_style_left}"
        for ((i=1; i<=${padding}; i++)); do echo -ne "${padding_char}"; done
    }

    border_right() {
        for ((i=1; i<=${padding}; i++)); do echo -ne "${padding_char}"; done
        echo -ne "${RESET}${FG_COLOR}${BG_COLOR}${border_style_right}${RESET}"
        for ((i=1; i<=${margin}; i++)); do echo -ne "${margin_char}"; done
        for ((i=1; i<=${offset}; i++)); do echo -ne "${offset_char}"; done
        echo
    }

    # Output text based on text_align argument
    align_center() {
        for ((i=1; i<=$((${text_padding}/2)); i++)); do echo -ne "${text_padding_char}"; done
        if ! (( ${#clean_line} % 2 == 0 )); then
            echo -ne "${clean_line} "
        else
            echo -ne "${clean_line}"
        fi
        for ((i=1; i<=$((${text_padding}/2)); i++)); do echo -ne "${text_padding_char}"; done 
    }

    align_left() {
        if ! (( ${#clean_line} % 2 == 0 )); then
            echo -ne "${clean_line} "
        else
            echo -ne "${clean_line}"
        fi
        for ((i=1; i<=${text_padding}; i++)); do echo -ne "${text_padding_char}"; done
    }

    align_right() {
        for ((i=1; i<=${text_padding}; i++)); do echo -ne "${text_padding_char}"; done
        if ! (( ${#clean_line} % 2 == 0 )); then
            echo -ne " ${clean_line}"
        else
            echo -ne "${clean_line}"
        fi
    }
    
    local text_size=${#text_input}
    local text_padding=$((${max_line_size}-${text_size}))

    # Remove any spaces from beginning and end of text_input
    local text_input=$(echo ${text_input} | sed -e 's/^[[:space:]]*//')

    # Read text_input line by line and fold line if larger than max_line_size
    while IFS= read -r line
        do
        if [[ ${#line} -ge ${max_line_size} ]]; then
            local text_input_formatted+=$(echo -ne ${line} | fold -s -w ${max_line_size})
        else
            local text_input_formatted+=$(echo -ne ${line})
        fi
    done < <(printf '%s\n' "${text_input}") 

    # Output top border
    echo
    border_top

    # Read lines of formatted input text
    local longest_line=0
    while IFS= read -r line
        do
            local clean_line=$(echo -ne ${line} | sed -e 's/^[[:space:]]*//')
            local line_size=${#clean_line}
            if ! (( ${#clean_line} % 2 == 0 )); then
                line_size=$((${#clean_line}+1))
            fi
            if [[ ${line_size} -gt ${longest_line} ]]; then
                longest_line=${line_size}
            fi
            local text_padding=$((${max_line_size}-${line_size}))
   
            border_left

            if [[ "${text_align}" == *"center"* ]]; then
                align_center
            elif [[ "${text_align}" == *"left"* ]]; then
                align_left
            elif [[ "${text_align}" == *"right"* ]]; then
                align_right
            else
                align_center
            fi

            border_right
   
    done < <(printf '%s\n' "${text_input_formatted}")   

    # Output bottom border
    border_bottom
    echo
}


function main() {
    test_text="Lorem ipsum\n\n dolor sit amet, consectetur adipiscing elit. Cras in odio mauris. \
    Integer aliquam urna quis lobortis iaculis. Proin non efficitur lectus, eu euismod est. In \
    et mauris arcu. Integer feugiat, elit eget lobortis faucibus, diam quam sollicitudin mi, \
    quis laoreet sapien sem nec leo. In viverra, libero quis varius aliquam, nisi dolor \
    bibendum lectus, a pretium tortor dolor at enim."

    echo
    echo -e "Example: term_text center double danger \${test_text}"
    term_text center double danger "${test_text}" 
    echo -e "Example: term_text left single warning \${test_text}"
    term_text left single warning "${test_text}" 
    echo -e "Example: term_text center asterisk success \${test_text}"
    term_text center asterisk success "${test_text}" 
    echo -e "Example: term_text left none info \${test_text}"
    term_text left none info "${test_text}" 
    echo -e "Example: term_text right none none \${test_text}"
    term_text right none none "${test_text}"
}

main


