#!/bin/bash
#: Title       : Process
#: Date        : 2024-03-12
#: Author      : Rebecca BurWei
#: Version     : 0.2.0
#: Description : ETL for Shiller stock data
#: Options     : None


# Set trap before you expect errors to happen
function handle_error {
  echo "Error on line $1 with exit status $?"
  exit 1
}
trap 'handle_error $LINENO' ERR


# Set an invalid url to demo the trap 
url="here-is-an-invalid-url"
echo "Downloading data from: $url" 

# Running curl on an invalid url triggers the trap
curl -o stock_data.xls $url

# These lines don't run because the trap was triggered
ssconvert -S stock_data.xls stock_data.csv
cut -d, -f10 stock_data.csv.4 | head  
rm stock_data.*
