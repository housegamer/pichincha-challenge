# Pichincha Challenge
Build a microservice that must have a REST endpoint named: /DevOps (use any preferred programming language or framework).
You must comply with the following requirements:
- The microservice must be containerized and can be deployed on any machine or in the cloud.
- It is required to use a load balancer with a minimum of two nodes with the same microservice.
- The infrastructure code must be versionated.
- The pipeline should be configured as a code and needs to be stored in a repository.

# How-To
Run the following curl comamnd in your local terminal
```curl
curl -X POST \
-H  "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
-H "Content-Type: application/json" \
-d '{ "message" : "<your-message>", "to": "<your-name>", "from": "<guess-name>", "timeToLifeSec" : 45 }' \
http://34.235.166.39/DevOps
```
This will generate a token, in which you will need to view it in https://jwt.io/ 

### Example
```curl
curl -X POST \
-H  "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
-H "Content-Type: application/json" \
-d '{ "message" : "This is a test", "to": "rod DC", "from": "Rita Asturia", "timeToLifeSec" : 45 }' \
http://34.235.166.39/DevOps
Hello rod DC, to see your message please use this token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXNzYWdlIjoiVGhpcyBpcyBhIHRlc3QiLCJ0byI6InJvZCBEQyIsImZyb20iOiJSaXRhIEFzdHVyaWEiLCJ0aW1lVG9MaWZlU2VjIjo0NX0.9tTiGdevSFD_s3gFATSkRieQoiWXz3JY6Ba1IfqnQ-s
```
