# Neo4j - Graph Database
A Neo4j graph database stores data as nodes, relationships, and properties instead of in tables or documents. 

## Getting Started

### Clone the Repository
```sh
git clone git@github.com:WhiteboxHub/classroom-databases-neo4j.git
cd classroom-databases-neo4j
```

### Build and Run the Neo4j Instance
```sh
docker build -t neo4j-custom .

docker run -d --name neo4j-instance -p 7474:7474 -p 7687:7687 neo4j-custom
```

## Connecting to Neo4j
There are multiple ways to connect to the Neo4j instance:

### A. Neo4j Browser (Web Interface)
1. Open [http://localhost:7474](http://localhost:7474) in a web browser.
2. Login using:
   - **Username:** `neo4j`
   - **Password:** `test123`

### B. Cypher Shell
The Cypher Shell is a command-line tool for interacting with the Neo4j database.

#### Install Neo4j CLI
If you don't have it installed, download it from the official [Neo4j Cypher Shell](https://neo4j.com/docs/operations-manual/5/tools/cypher-shell/) page.

#### Connect via Cypher Shell
```sh
cypher-shell -a bolt://localhost:7687 -u neo4j -p test123
```

### C. Neo4j Desktop
Download and install [Neo4j Desktop](https://neo4j.com/download/) for a graphical interface to manage your database.

---

## Queries Covering Neo4j Concepts

### 1. Fetch All Nodes and Relationships
```cypher
MATCH (n) RETURN n;
```

### 2. Find Students Enrolled in a Specific Course
```cypher
MATCH (s:Student)-[:ENROLLED_IN]->(c:Course {name: "Algebra"})
RETURN s.name;
```

### 3. Find All Courses for a Given Student
```cypher
MATCH (s:Student {name: "Alice"})-[:ENROLLED_IN]->(c:Course)
RETURN c.name;
```

### 4. Find All Subjects with Their Courses
```cypher
MATCH (s:Subject)<-[:BELONGS_TO]-(c:Course)
RETURN s.name AS Subject, COLLECT(c.name) AS Courses;
```

### 5. Add a New Student and Enroll in a Course
```cypher
CREATE (s:Student {name: "David", studentId: "S004"});
MATCH (s:Student {name: "David"}), (c:Course {name: "Data Structures"})
CREATE (s)-[:ENROLLED_IN]->(c);
```

### 6. Find All Courses Without Students
```cypher
MATCH (c:Course)
WHERE NOT EXISTS {
  MATCH (s:Student)-[:ENROLLED_IN]->(c)
}
RETURN c.name;
```

### 7. Count Students Enrolled in Each Course
```cypher
MATCH (c:Course)<-[:ENROLLED_IN]-(s:Student)
RETURN c.name, COUNT(s) AS student_count;
```

### 8. Delete a Student and Their Enrollments
```cypher
MATCH (s:Student {name: "Alice"})
DETACH DELETE s;
```

---

## License
This project is licensed under the MIT License.

## Contributors
- Whitebox Learning
