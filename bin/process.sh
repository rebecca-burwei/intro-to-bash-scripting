#!/bin/bash
#: Title       : Process
#: Date        : 2024-03-12
#: Author      : Rebecca BurWei
#: Version     : 0.1.0
#: Description : ETL for Shiller stock data
#: Options     : None

url=http://www.econ.yale.edu/~shiller/data/ie_data.xls
echo "Downloading data from: $url" 
curl -o stock_data.xls $url
ssconvert -S stock_data.xls stock_data.csv
cut -d, -f10 stock_data.csv.4 | head  
rm stock_data.*
