//Find duplicates: (Collection and then key)
db.nodes.aggregate(
    { $group : {_id : {"id" : "$id", "version":"$version"}, total : { $sum : 1 } } },
    { $match : { total : { $gte : 2 } } },
    { $sort : {total : -1} },
    { $limit : 5 }
);

//Need it to be bigger!
var dups = db.nodes.aggregate(
	[ { $group : {_id : {"id" : "$id", "version":"$version"}, total : { $sum : 1 } } },
      { $match : { total : { $gte : 2 } } },
      { $sort : {total : -1} }
    ],{ allowDiskUse: true } )


var dupNodes = db.nodes.aggregate(
  [ { "$group": 
      { "_id": { "id": "$id", "version": "$version" },
        "dups": { "$push": "$_id" },
        "count": { "$sum": 1 }
      }
    },
    { "$match": 
      { "count": { "$gt": 1 } }
    }
   ],{ allowDiskUse : true}
);

dupNodes.forEach(function(doc) {
    doc.dups.shift();
    db.nodes.remove({_id : { "$in": doc.dups }});
});


var dupWays = db.ways.aggregate(
  [ { "$group": 
      { "_id": { "id": "$id", "version": "$version" },
        "dups": { "$push": "$_id" },
        "count": { "$sum": 1 }
      }
    },
    { "$match": 
      { "count": { "$gt": 1 } }
    }
   ],{ allowDiskUse : true}
)

dupWays.forEach(function(doc) {
    doc.dups.shift();
    db.ways.remove({_id :{ "$in": doc.dups }});
});



//Update the changeset collection
// [994,995,1001,1002,1003,1004,1006,1007,1008,1009,1010,1014,1015,1016,1017,1018].forEach(function(tname){
// 	project = "#hotosm-project-"+tname
// 	task    = "#hotosm-task-"+tname
// 	Nepal   = "#hotosm-Nepal-earthquake-"+tname
// 	nepal   = "#hotosm-nepal-earthquake-"+tname

// 	types = [project, task, nepal, Nepal]
// 	types.forEach(function(t){
// 		db.changeset_tags.update({tag: t},{$set:{tag:t}}, {upsert:true})
// 	})
// })

//Eventually we'll need to write this function:
//
// Find duplicate nodes & ways with multiple version numbers and drop one... that'll be difficult though
//
//
// db.events.aggregate([
//     { "$group": {
//         "_id": { "uid": "$uid", "sid": "$sid" },
//         "dups": { "$push": "$_id" },
//         "count": { "$sum": 1 }
//     }},
//     { "$match": { "count": { "$gt": 1 } }}
// ]).forEach(function(doc) {
//     doc.dups.shift();
//     db.events.remove({ "$in": doc.dups });
// });
//