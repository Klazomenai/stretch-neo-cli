## DebianStretch, .net, neo-cli
### Reasons
Play with the [NEO](https://neo.org/) command line wallet [neo-cli](https://github.com/neo-project/neo-cli) and PoS mining. 

.net Docker image from [microsoft/dotnet](https://hub.docker.com/r/microsoft/dotnet/) Docker Hub. Very bloated, could do with making moar skinny.

### Single instance for local play
Build, run, shell in:
```sh
docker build -t stretch-neo-cli:0 .
docker run --name neo-cli stretch-neo-cli:0
docker exec -it neo-cli /bin/sh
```

[CLI Command Reference](http://docs.neo.org/en-us/node/cli.html)

### Chain Data
The chaindata lives in the `/Chain` directory on the container.
