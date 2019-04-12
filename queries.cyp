//Queries to write (“queries.cyp”). These are based on a single student, who will be called X in the following queries

//Assuming here X is A person 1

//1.     Where did X park?
MATCH (X:Person)-[:PARKED_AT]-(lot)
WHERE X.name = "A person 1" RETURN lot

//2.     Which courses is X taking?
MATCH (X:Person)-[:TOOK]-(subjects)
WHERE X.name = "A person 1" RETURN subjects

//3.     Which buildings did X visit?
MATCH (X:Person)-[:VISITED]-(buildings)
WHERE X.name = "A person 1" RETURN buildings

//4.     Which other students did X study with?
MATCH (X:Person)-[:STUDIED_WITH]-(students)
WHERE X.name = "A person 1" RETURN students

//5.     When is X studying with other students?
MATCH (X:Person)-[r:STUDIED_WITH]-(students)
	WHERE X.name = "A person 1" RETURN r.whattime as time , students.name as name
//OR
MATCH (:Person{name:'A person 1'})-[r:STUDIED_WITH]-(students)
RETURN r.whattime,students.name

//6.     How far did X walk?
MATCH (X:Person)-[r:VISITED]-(buildings)
	WHERE X.name = "A person 1" RETURN sum(r.distance) as dist_walked_meters

//7.     Which student did X spend the most time studying with?
MATCH (X:Person)-[r:STUDIED_WITH]-(students)
	WHERE X.name = "A person 1" RETURN r.howlong as time, students.name as name
  ORDER BY time desc LIMIT 1

//8.     Which other students are taking the same courses as X?
MATCH (X:Person)-[:TOOK]-(courses)-[:TOOK]-(Y:Person)
 WHERE X.name = "A person 1" return Y.name
