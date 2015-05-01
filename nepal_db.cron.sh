date
echo "Running Nepal_db_cron.sh"
cd /home/osm/epic-osm/

echo "Currently in: "
pwd

echo "Running the realtime update to the config file"
/usr/local/rbenv/shims/rake realtime /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

date
echo "Running tag and nodeway imports"
#Run the realtime updates
/usr/local/rbenv/shims/rake import:osmtm_tags /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
/usr/local/rbenv/shims/rake import:nodeways   /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

date
echo "Running User Imports"
#Ensure we have users for the entire analysis window
/usr/local/rbenv/shims/rake import:users      /home/osm/nepal-earthquake/nepal-earthquake.yml