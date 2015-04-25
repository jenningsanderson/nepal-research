#! /bin/bash
cd /data/www/nepal/json
wget -r -nH --cut-dirs=1 --no-parent --reject="index.html*" http://ec2-54-242-150-21.compute-1.amazonaws.com/nepal/

nodejs ~/osmdown/bin/osmdown build ~/nepal-earthquake/nepal.osmdown
