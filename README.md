# Docker cookbook

#### Definition of Container

Containers isolate the application from the environment in which it runs, ensuring that it functions consistently across any platform.

#### Definition of Docker

Docker is a containerization platform that automates the creation, deployment, and execution of applications in containers.

#### Advantages of Docker

- Consistency between development, testing, and production environments.
- Ease of distribution and scalability.
- Isolation of applications and their dependencies.

#### Docker compose

A tool for defining and running multi-container applications. It facilitates the management of containers that depend on one another.

#### Best practises

- Use Alpine or minimal images to reduce image size.
- Split the image build process into multiple stages.
- Use volumes for data persistence.
- Avoid hardcoding credentials.

#### Dockerfile example

```Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN pnpm install
COPY . .

CMD ["pnpm", "start"]
```

#### Docker compose example

```yaml
services:
  postgres:
    image: postgres:16-alpine
    container_name: database_container_name
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
```

#### Useful commands

| Command                                 | Description                                                                                  |
| --------------------------------------- | -------------------------------------------------------------------------------------------- |
| `docker build -t image_name .`          | Builds a Docker image from the Dockerfile in the current directory.                          |
| `docker run -d -p 3000:3000 image_name` | Starts a container in the background and maps port 3000 of the container to local port 3000. |
| `docker ps`                             | Shows the list of currently running containers.                                              |
| `docker ps -a`                          | Shows the list of all containers, including stopped ones.                                    |
| `docker start container_name`           | Starts an existing container that was previously created or stopped.                         |
| `docker stop container_name`            | Stops a running container.                                                                   |
| `docker rm container_name`              | Removes a stopped container.                                                                 |
| `docker rmi image_name`                 | Deletes a Docker image.                                                                      |
| `docker exec -it container_name bash`   | Accesses an interactive shell inside the container.                                          |
| `docker logs container_name`            | Displays the logs of a running container.                                                    |
| `docker-compose up`                     | Starts all services defined in the `docker-compose.yml` file.                                |
| `docker-compose up -d`                  | Starts all services in the background (detached mode).                                       |
| `docker-compose down`                   | Stops and removes all containers, networks, and volumes created by Docker Compose.           |
| `docker-compose ps`                     | Shows the status of containers managed by Docker Compose.                                    |
| `docker-compose logs`                   | Displays the logs of all services defined in the `docker-compose.yml` file.                  |
| `docker-compose stop`                   | Stops the containers started with Docker Compose without removing them.                      |
| `docker volume ls`                      | Lists all available Docker volumes.                                                          |
| `docker network ls`                     | Lists all available Docker networks.                                                         |
| `docker pull image_name`                | Downloads a Docker image from Docker Hub or another registry.                                |
| `docker inspect container_name`         | Shows the details and configuration of a container or Docker image.                          |
