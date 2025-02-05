# Use official Neo4j image
FROM neo4j:5.12

# Set environment variables for authentication
ENV NEO4J_AUTH=neo4j/testpassword123

# Copy the initialization Cypher script
COPY init.cypher /var/lib/neo4j/import/init.cypher

# Run the initialization script on startup
CMD ["neo4j"]
