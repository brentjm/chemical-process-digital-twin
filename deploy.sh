#!/bin/bash

FILE="digital_twin"

set -e

# 1. Generate Blender model
# blender --background --python create_blender_model.py

# 2. Export to glTF
# blender --background --python export_gltf.py

# 1-2 (Alternative): If you have a specific Blender file to use
blender --background --python export_gltf.py

# 3. Prepare web files
mkdir -p deploy
cp index.html deploy/
cp "${FILE}.glb" deploy/

# 4. Serve locally with nginx (assumes nginx is installed and running)
echo "server {
    listen 8080;
    server_name localhost;
    location / {
        root $(pwd)/deploy;
        autoindex on;
    }
}" > deploy/nginx.conf

echo "To serve locally, run:"
echo "sudo nginx -c $(pwd)/deploy/nginx.conf"

# 5. To deploy to AWS S3 (assumes AWS CLI configured)
echo "To deploy to S3, run:"
echo "aws s3 sync deploy/ s3://YOUR_BUCKET_NAME/ --acl public-read"
