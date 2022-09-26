for(var i=0; i<10000; i++){
    db.teste1.insert({'name': 'Teste'+i,'número': i})
};

db.getCollection('teste1').count({});

