#! /bin/bash
echo "Getting latest from Mikel's exports"
cd /data/www/nepal/json
wget "*.json" -nH --cut-dirs=1 -r --level=1 --no-parent --reject="index.html" http://ec2-54-242-150-21.compute-1.amazonaws.com/nepal/

echo "Getting lateset update to nepal.osmdown from github"
cd ~/nepal-earthquake
git stash 					#Need to stash the latest
git pull					#Update

echo "Building the page"
nodejs ~/osmdown/bin/osmdown build ~/nepal-earthquake/nepal.osmdown

echo "Building the live page"
node ~/osmdown/bin/osmdown build ~/nepal-earthquake/nepal-live.osmdown