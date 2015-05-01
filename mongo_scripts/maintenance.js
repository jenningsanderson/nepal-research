//Find duplicates: (Collection and then key)
// db.users.aggregate(
//     { $group : {_id : "$uid", total : { $sum : 1 } } },
//     { $match : { total : { $gte : 2 } } },
//     { $sort : {total : -1} },
//     { $limit : 5 }
// );


//Update the changeset collection
[994,995,1001,1002,1003,1004,1006,1007,1008,1009,1010,1014,1015,1016,1017,1018].forEach(function(tname){
	project = "#hotosm-project-"+tname
	task    = "#hotosm-task-"+tname
	Nepal   = "#hotosm-Nepal-earthquake-"+tname
	nepal   = "#hotosm-nepal-earthquake-"+tname

	types = [project, task, nepal, Nepal]
	types.forEach(function(t){
		db.changeset_tags.update({tag: t},{$set:{tag:t}}, {upsert:true})
	})
})