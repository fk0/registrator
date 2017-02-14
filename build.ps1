mkdir bin

docker build -t spring2/registrator:build -f Dockerfile.buildwin .
docker run --name registrator-build spring2/registrator:build registrator.exe --version
docker cp registrator-build:c:/registrator.exe bin/registrator.exe
docker rm registrator-build

docker build -t spring2/registrator:latest-nanoserver -f Dockerfile.nanoserver .
docker tag spring2/registrator:latest-nanoserver spring2/registrator:latest
docker build -t spring2/registrator:latest-windowsservercore -f Dockerfile.windowsservercore .

rm bin -Force -Recurse