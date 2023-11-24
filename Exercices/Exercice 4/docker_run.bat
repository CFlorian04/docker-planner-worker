@echo off

:: Création du Réseau 
docker network create exercice4-network

set "scriptDir=%~dp0"

:: Planner
cd %scriptDir%..\..\planner
docker rm exercice4-planner
docker image rm exercice4-planner
docker build -t exercice4-planner .
docker run -p 3000:3000 --network exercice4-network --name exercice4-planner exercice4-planner

:: Worker -> Loop
set "workerNumber=10"
cd %scriptDir%..\..\worker
setlocal enabledelayedexpansion

set "workerPort=8000"

for /L %%i in (1, 1, %workerNumber%) do (
    set "name=exercice4-worker%%i"
    echo Current Number: %%i, name: !name!, port: !workerPort!
    docker rm !name!
    docker image rm !name!
    docker build -t !name! .
    set /A currentPort=workerPort+%%i
    set "command=docker run -p !currentPort!:!currentPort! --network exercice4-network --name !name! !name!"
    curl.exe -X POST "http://localhost:3000/register" -H "Content-Type: application/json" -d "{\"url\": \"http://!name!:8080\"}"
    !command!
)

endlocal

pause >nul
