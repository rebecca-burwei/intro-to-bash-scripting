#!/bin/bash
#: Title       : Logger
#: Date        : 2024-03-12
#: Author      : Rebecca BurWei
#: Version     : 0.1.0
#: Description : Write outputs and errors to file
#: Arguments   : (1) path to the file you want to log

$1 > "$1_output.txt" 2> "$1_errors.txt"
