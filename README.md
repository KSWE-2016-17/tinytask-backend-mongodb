# MongoDB for TinyTask Backend

**THIS IS FOR TESTING AND DEVELOPING PURPOSES ONLY!!!**

This repository contains a `Dockerfile` file and a `docker-compose.yml` config
file which can be used to create a Docker image and also containers running
`MongoDB` instances.
As there exists a Docker image for MongoDB already,
which is called `mongo`,
this `Dockerfile` extends the image by the ability to import database dumps
when a corresponding container is beeing started for the first time.

The database dumps in the `dumps` directory can also be used without the Docker
image,
if there exists a MongoDB instance already.
If this is the case and the usage of the existing instance is watend,
use `mongorestore` tool to import the database dumps.
Otherwise use the manual afterwards.

## Using docker-compose

```bash
# Clone the repository.
# cd into the working copy of the repository.

# Build the image, create and run the container in detached mode.
docker-compose up -d
```

The available config exposes the TCP port `27017`.
If you want to use another port an the host's side,
then change the host port in `docker-compose.yml` in the `ports` section
which contains an array with port definitions.
The first number is the port used by the host and the second one is the port
used by the container.

## Using docker on its own

Well,
if you want to use Docker itself,
then you properbly know what you're doing and so you don't need any help at this
point.

But bear in mind:

- Bind the container's port `27017` to reach the MongoDB instance.
- Mount a volume for the `dumps` directory to `/dumps` directory,
    so that the container is able to import the database dumps (if wanted).
