cd ~/epic-osm/

rake realtime ~/nepal-earthquake/nepal-earthquake_rt.yml

#Run the realtime updates
rake import:osmtm_tags ~/nepal-earthquake/nepal-earthquake_rt.yml
rake import:nodeways   ~/nepal-earthquake/nepal-earthquake_rt.yml

#Ensure we have users for the entire analysis window
rake import:users      ~/nepal-earthquake/nepal-earthquake.yml



#Run the time-binned questions
rake questions:changesets  ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:users       ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:multi_users ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:ways        ~/nepal-earthquake/nepal-earthquake_rt.yml

#Run other questions?
rake questions:users   ~/nepal-earthquake/nepal-earthquake.yml