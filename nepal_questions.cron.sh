date
echo "Running Nepal_Questions_cron.sh"
cd /home/osm/epic-osm/

echo "Currently in: "
pwd

echo "Updating the analysis window time"
#Update the analysis window to reflect the latest
rake realtime /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

echo "Running the time binned questions"
#Run the time-binned questions
rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:multi_users /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
# rake questions:ways        ~/nepal-earthquake/nepal-earthquake_rt.yml

echo "Running all the other questions"
#Run other questions?
rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake.yml
rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake.yml