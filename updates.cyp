//Updates to write (“updates.cyp”)

//1.  Change the room number for one of X’s courses
//Sol:
MATCH (X:Person)-[:TOOK]-(courses)
 WHERE X.name = "B person 2" SET courses.room = "Nold"
RETURN X.name,courses.room
LIMIT 1


//2. Represent adding a time for lunch
//Sol:
//this will add a lunch time for a person during visit to a location.
MATCH (X:Person)-[:VISITED]-(building)
 WHERE X.name = "B person 2" and building.name = "SF building" SET building.lunch = "13:00"
RETURN X.name,building.lunch

//3.  Represent the effect of dropping a course. This includes not only removing the relationship of taking the course,
//but modifying other parts of the graph to account for where X would spend time instead.
//Assume that the student must stay on campus for the same time period – for example, because of a carpool.

//Sol::
//Assuming here the studnet is A person 1 and teh course is Database
//Find the duration of that course
//Assume that for the lost time, time is spent in library.
MATCH (X:Person)-[r]-(courses)
 WHERE X.name = "A person 1" and courses.classname = "Database systems"
MATCH(Y:Building) where Y.name = "Library"
MERGE
(X)-[V:VISITED {distance:300, time_spent:courses.duration }]->(Y)
DELETE r


//4.  Add a different possible parking location and include the connections to where X had to go.
//Modify the query for how far the student walked to determine the better parking location for the student (least distance walked).
//The better parking location and the total distance walked should be in the final result.
CREATE (ParkingLotD:Parking {name:"lot D"})

MATCH (X:Person) WHERE X.name = "A person 1"
MATCH (Y:Parking) WHERE Y.name = "lot D"
CREATE
(X)-[:VISITED {distance:600}]-> (Y)

MATCH (X:Person)-[r:VISITED]-(pd)
WHERE X.name = "A person 1"
return pd.name,
	case	when pd.name = "lot D" THEN sum(r.distance)-600
    		when pd.name = "lot A" THEN sum(r.distance)-500
    END as sum_distance
