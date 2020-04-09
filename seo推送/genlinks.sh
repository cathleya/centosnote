#!/bin/sh

# domain="http://www.fy921.com/show/"

domain="http://www.fyz99.com/show/"

for ((i=173; i<=189; i ++));
do
	echo "$domain$i" >> urls.txt
done

curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=www.fy921.com&token=kN9d3RgP3tS8AkE7"

sleep 60
