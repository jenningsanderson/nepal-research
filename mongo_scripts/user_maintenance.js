//Find duplicates: (Collection and then key)
db.users.aggregate(
    { $group : {_id : "$id", total : { $sum : 1 } } },
    { $match : { total : { $gte : 2 } } },
    { $sort : {total : -1} },
    { $limit : 5 }
);