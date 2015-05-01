date
echo "Running Nepal_Questions_cron.sh"
cd /home/osm/epic-osm/

#Update the analysis window to reflect the latest
rake realtime /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

#Run the time-binned questions
rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:multi_users /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
# rake questions:ways        ~/nepal-earthquake/nepal-earthquake_rt.yml

#Run other questions?
rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake.yml
rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake.yml