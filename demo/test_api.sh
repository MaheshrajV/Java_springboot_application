#!/bin/bash

echo "=== 1. HEALTH CHECK ==="
curl -s -X GET http://localhost:8080/health
echo -e "\n"

echo "=== 2. CREATE RECORD ==="
curl -s -X POST http://localhost:8080/records \
  -H "Content-Type: application/json" \
  -d '{"name":"Test Record","description":"For testing"}'
echo -e "\n"

echo "=== 3. GET ALL RECORDS ==="
curl -s -X GET http://localhost:8080/records
echo -e "\n"

echo "=== 4. UPDATE RECORD (ID=1) ==="
curl -s -X PUT http://localhost:8080/records/1 \
  -H "Content-Type: application/json" \
  -d '{"name":"Updated Name","description":"Updated Description"}'
echo -e "\n"

echo "=== 5. DELETE RECORD (ID=1) ==="
curl -s -X DELETE http://localhost:8080/records/1
echo -e "\n"

echo "=== 6. GET ALL RECORDS AFTER DELETE ==="
curl -s -X GET http://localhost:8080/records
echo -e "\n"

