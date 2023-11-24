@echo off

:: Création du Réseau 
docker network create exercice5-network

set "scriptDir=%~dp0"

:: Planner
cd %scriptDir%..\..\planner
docker rm exercice5-planner
docker image rm exercice5-planner
docker build -t exercice5-planner .
docker run -p 3000:3000 --network exercice5-network --name exercice5-planner exercice5-planner

:: Worker -> Loop
set "workerNumberGEN=10"
set "workerNumberADD=10"
set "workerNumberMULT=10"


cd %scriptDir%..\..\worker
setlocal enabledelayedexpansion

set "workerPort=8000"

for /L %%i in (1, 1, %workerNumberGEN%) do (
    set "name=exercice5-worker%%i"
    echo Current Number: %%i, name: !name!, port: !workerPort!
    docker rm !name!
    docker image rm !name!
    docker build -t !name! --build-arg ADD=true --build-arg MULT=true .
    set /A currentPort=workerPort+%%i
    set "command=docker run -p !currentPort!:!currentPort! --network exercice5-network --name !name! !name!"
    curl.exe -X POST "http://localhost:3000/register" -H "Content-Type: application/json" -d "{\"url\": \"http://!name!:8080\"}"
    !command!
)

for /L %%i in (1, 1, %workerNumberADD%) do (
    set "name=exercice5-worker%%i"
    echo Current Number: %%i, name: !name!, port: !workerPort!
    docker rm !name!
    docker image rm !name!
    docker build -t !name! --build-arg ADD=true --build-arg MULT=false .
    set /A currentPort=workerPort+%%i
    set "command=docker run -p !currentPort!:!currentPort! --network exercice5-network --name !name! !name!"
    curl.exe -X POST "http://localhost:3000/register" -H "Content-Type: application/json" -d "{\"url\": \"http://!name!:8080\"}"
    !command!
)

for /L %%i in (1, 1, %workerNumberMULT%) do (
    set "name=exercice5-worker%%i"
    echo Current Number: %%i, name: !name!, port: !workerPort!
    docker rm !name!
    docker image rm !name!
    docker build -t !name! --build-arg ADD=false --build-arg MULT=true.
    set /A currentPort=workerPort+%%i
    set "command=docker run -p !currentPort!:!currentPort! --network exercice5-network --name !name! !name!"
    curl.exe -X POST "http://localhost:3000/register" -H "Content-Type: application/json" -d "{\"url\": \"http://!name!:8080\"}"
    !command!
)

endlocal

pause >nul
