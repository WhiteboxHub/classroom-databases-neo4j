// Clean the database
MATCH (n) DETACH DELETE n;

// Create Subjects
CREATE (:Subject {name: "Mathematics", code: "MATH101"});
CREATE (:Subject {name: "Physics", code: "PHYS101"});
CREATE (:Subject {name: "Computer Science", code: "CS101"});

// Create Courses and link to Subjects
CREATE (c1:Course {name: "Algebra", courseId: "ALG-001"})-[:BELONGS_TO]->(:Subject {name: "Mathematics"});
CREATE (c2:Course {name: "Quantum Mechanics", courseId: "QM-101"})-[:BELONGS_TO]->(:Subject {name: "Physics"});
CREATE (c3:Course {name: "Data Structures", courseId: "DS-201"})-[:BELONGS_TO]->(:Subject {name: "Computer Science"});

// Create Students
CREATE (s1:Student {name: "Alice", studentId: "S001"});
CREATE (s2:Student {name: "Bob", studentId: "S002"});
CREATE (s3:Student {name: "Charlie", studentId: "S003"});

// Enroll Students in Courses
MATCH (s:Student {name: "Alice"}), (c:Course {name: "Algebra"})
CREATE (s)-[:ENROLLED_IN]->(c);

MATCH (s:Student {name: "Bob"}), (c:Course {name: "Quantum Mechanics"})
CREATE (s)-[:ENROLLED_IN]->(c);

MATCH (s:Student {name: "Charlie"}), (c:Course {name: "Data Structures"})
CREATE (s)-[:ENROLLED_IN]->(c);
