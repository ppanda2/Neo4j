CREATE (Astudent:Person {name:'A person 1', netid:1})
CREATE (Bstudent:Person {name:'B person 2', netid:2})
CREATE (Cstudent:Person {name:'C person 3', netid:3})
CREATE (Dstudent:Person {name:'D person 4', netid:4})
CREATE (Estudent:Person {name:'E person 5', netid:5})
CREATE (Fstudent:Person {name:'F person 6', netid:6})
CREATE (Gstudent:Person {name:'G person 7', netid:7})

CREATE (Database:Class {classname:'Database systems', room:'N101', time:"10:00", duration: 60})
CREATE (Network:Class {classname:'Network security', room:'N202',time:"14:00", duration: 60})
CREATE (Algorithms:Class {classname:'Algorithms', room:'S101',time:"16:00", duration: 60})
CREATE (Operating:Class {classname:'Opearating systems', room:'S202',time:"18:00", duration: 90})

CREATE (ParkingLotA:Parking {name:"lot A"})
CREATE (ParkingLotB:Parking {name:"lot B"})
CREATE (ParkingLotC:Parking {name:"lot C"})

CREATE (Library:Building {name:"Library"})
CREATE (SF:Building {name:"SF building"})
CREATE (UU:Building {name:"University Union"})
CREATE (Science:Building {name:"Science Building"})
CREATE (MBA:Building {name:"MBA Building"})
CREATE (Arts:Building {name:"Arts Building"})
CREATE (Cafeteria:Building {name:"Cafeteria"})

CREATE (Starbucks:Coffeeshop {name:"Starbucks"})
CREATE (Petes:Coffeeshop {name:"Petes Coffee"})

CREATE
 (Astudent)-[:TOOK]->(Database),
 (Bstudent)-[:TOOK]->(Network),
 (Bstudent)-[:TOOK]->(Database),
 (Cstudent)-[:TOOK]->(Algorithms),
 (Dstudent)-[:TOOK]->(Operating),
 (Dstudent)-[:TOOK]->(Algorithms),
 (Dstudent)-[:TOOK]->(Database),
 (Estudent)-[:TOOK]->(Database),
 (Fstudent)-[:TOOK]->(Network),
 (Gstudent)-[:TOOK]->(Database)



CREATE
(Astudent)-[:INTERACTED_WITH]->(Bstudent),
(Astudent)-[:INTERACTED_WITH]->(Cstudent),
(Astudent)-[:INTERACTED_WITH]->(Dstudent),
(Astudent)-[:INTERACTED_WITH]->(Estudent),
(Bstudent)-[:INTERACTED_WITH]->(Fstudent),
(Cstudent)-[:INTERACTED_WITH]->(Gstudent),
(Dstudent)-[:INTERACTED_WITH]->(Estudent)

CREATE
(Astudent)-[:PARKED_AT]->(ParkingLotA),
(Bstudent)-[:PARKED_AT]->(ParkingLotA),
(Cstudent)-[:PARKED_AT]->(ParkingLotA),
(Dstudent)-[:PARKED_AT]->(ParkingLotB),
(Estudent)-[:PARKED_AT]->(ParkingLotC),
(Fstudent)-[:PARKED_AT]->(ParkingLotC)

//time spent is hours
//distance in meters
CREATE
(Astudent)-[:VISITED {distance:300, time_spent: 160, hadlunch:"12:00"}]-> (Library),
(Astudent)-[:VISITED {distance:100, time_spent: 100}]-> (SF),
(Astudent)-[:VISITED {distance:200, time_spent: 100}]-> (Science),
(Astudent)-[:VISITED {distance:100, time_spent: 100}]-> (UU),
(Astudent)-[:VISITED {distance:200, time_spent: 200}]-> (Cafeteria),
(Astudent)-[:VISITED {distance:300, time_spent: 30}]-> (Starbucks),
(Bstudent)-[:VISITED {distance:600, time_spent: 200}]-> (Arts),
(Bstudent)-[:VISITED {distance:300, time_spent: 100, hadlunch:"12:00"}]-> (Library),
(Bstudent)-[:VISITED {distance:100, time_spent: 100}]-> (SF),
(Cstudent)-[:VISITED {distance:200, time_spent: 200}]-> (Science),
(Cstudent)-[:VISITED {distance:300, time_spent: 200, hadlunch:"12:00"}]-> (Starbucks),
(Dstudent)-[:VISITED {distance:300, time_spent: 200, hadlunch:"12:00"}]-> (Library),
(Estudent)-[:VISITED {distance:100, time_spent: 400, hadlunch:"12:00"}]-> (SF),
(Fstudent)-[:VISITED {distance:10, time_spent: 30, hadlunch:"12:00"}]-> (Petes),
(Gstudent)-[:VISITED {distance:500, time_spent: 300, hadlunch:"12:00"}]-> (MBA)

CREATE
(Astudent)-[:STUDIED_WITH {whattime:"10:00",howlong: 60}]->(Bstudent),
(Astudent)-[:STUDIED_WITH {whattime:"11:00",howlong: 30}]->(Cstudent),
(Astudent)-[:STUDIED_WITH {whattime:"13:00",howlong: 40}]->(Dstudent),
(Estudent)-[:STUDIED_WITH {whattime:"12:00",howlong: 60}]->(Fstudent),
(Fstudent)-[:STUDIED_WITH {whattime:"12:00",howlong: 60}]->(Estudent)
