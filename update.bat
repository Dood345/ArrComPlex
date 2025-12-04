@echo off
echo ---------------------------------------------------
echo UPDATING DESKTOP MEDIA STACK...
echo ---------------------------------------------------

:: 1. Navigate to your compose folder
cd /d "C:\Users\dood3\dockerComPlex"

:: 2. Pull the new layers from the internet
docker compose pull

:: 3. Recreate only the containers that have updates
docker compose up -d

:: 4. Clean up old junk images to save space
docker image prune -f

echo ---------------------------------------------------
echo UPDATE COMPLETE.
echo ---------------------------------------------------
pause