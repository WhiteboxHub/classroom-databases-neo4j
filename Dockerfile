# Use official Neo4j image
FROM neo4j:5.12

# Set environment variables for authentication
ENV NEO4J_AUTH=neo4j/test123

# Copy the initialization Cypher script
COPY init.cypher /var/lib/neo4j/import/init.cypher

# Start Neo4j and then execute the script
CMD ["bash", "-c", "neo4j start && sleep 10 && cypher-shell -u neo4j -p test123 -f /var/lib/neo4j/import/init.cypher && tail -f /dev/null"]
