date
echo "Running Nepal_Questions_cron.sh"
cd /home/osm/epic-osm/

echo "Currently in: "
pwd

echo "Updating the analysis window time"
#Update the analysis window to reflect the latest
/usr/local/rbenv/shims/rake realtime /home/osm/nepal-earthquake/nepal-earthquake_rt.yml

echo "Running the time binned questions"
#Run the time-binned questions
/usr/local/rbenv/shims/rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
/usr/local/rbenv/shims/rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
/usr/local/rbenv/shims/rake questions:multi_users /home/osm/nepal-earthquake/nepal-earthquake_rt.yml
# rake questions:ways        ~/nepal-earthquake/nepal-earthquake_rt.yml

echo "Running all the other questions"
#Run other questions?
/usr/local/rbenv/shims/rake questions:users       /home/osm/nepal-earthquake/nepal-earthquake.yml
/usr/local/rbenv/shims/rake questions:changesets  /home/osm/nepal-earthquake/nepal-earthquake.yml