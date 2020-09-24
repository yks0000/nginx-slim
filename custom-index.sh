#!/bin/bash

INDEX_HTML="/usr/share/nginx/html/index.html"

: > $INDEX_HTML

echo "Environment variable of host: $HOSTNAME" >> $INDEX_HTML
for var in $(env);
  do echo "<p>$var</p>" >> $INDEX_HTML;
done

nginx -g 'daemon off;'