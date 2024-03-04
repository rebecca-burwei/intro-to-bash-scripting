#!/bin/bash
#: Title       : Process
#: Date        : 2024-03-12
#: Author      : Rebecca BurWei
#: Version     : 0.2.0
#: Description : ETL for Shiller stock data
#: Options     : (f) list of fields to extract separated by commas


# Getopts code
#   Tutorial Questions: 
#     * Do you see any familiar commands?
#     * What do the variables `opt` and `OPTARG` do?
#     * When do lines 19-20 execute?
usage="Available options: -f ) list of fields to extract"
while getopts "f:" opt; do
  case $opt in 
    f  ) fields=$OPTARG ;;
    \? ) echo $usage
         exit 1 ;;
  esac
done


url=http://www.econ.yale.edu/~shiller/data/ie_data.xls
echo "Downloading data from: $url" 
curl -o stock_data.xls $url
ssconvert -S stock_data.xls stock_data.csv
cut -d, -f $fields stock_data.csv.4 | head  
rm stock_data.*
