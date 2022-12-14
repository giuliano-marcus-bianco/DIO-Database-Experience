db.getCollection("restaurants").count({});

db.getCollection("restaurants").distinct('cuisine');

db.getCollection("restaurants").aggregate([{$group: {_id: '$cuisine', total: {$sum: 1}}}]);
      
db.getCollection("restaurants").aggregate([{$addFields:{'teste':true}}]);

db.getCollection("restaurants").aggregate([{$group: {_id: '$cuisine', total: {$sum: 1}, id_maximo:{$max:'$restaurant_id'}}}]);

db.getCollection("restaurants").aggregate([{$group: {_id: '$cuisine', total: {$sum: 1}, id_minimo:{$min:'$restaurant_id'}}}]);

db.getCollection('restaurants').aggregate([{$match : {$and:[{cuisine: 'American'}, {borough: 'Brooklyn'}] }}])

db.getCollection('restaurants').aggregate([{$match : {$or:[{cuisine: 'American'}, {borough: 'Brooklyn'}] }}])
    
