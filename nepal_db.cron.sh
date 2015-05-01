date
echo "Running Nepal_db_cron.sh"
cd /home/osm/epic-osm/

rake realtime /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

#Run the realtime updates
rake import:osmtm_tags /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
rake import:nodeways   /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

#Ensure we have users for the entire analysis window
rake import:users      /home/osm/nepal-earthquake/nepal-earthquake.yml