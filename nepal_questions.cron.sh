cd ~/epic-osm/

#Update the analysis window to reflect the latest
rake realtime ~/nepal-earthquake/nepal-earthquake_rt.yml

#Run the time-binned questions
rake questions:changesets  ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:users       ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:multi_users ~/nepal-earthquake/nepal-earthquake_rt.yml
rake questions:ways        ~/nepal-earthquake/nepal-earthquake_rt.yml

#Run other questions?
rake questions:users       ~/nepal-earthquake/nepal-earthquake.yml
rake questions:changesets  ~/nepal-earthquake/nepal-earthquake.yml