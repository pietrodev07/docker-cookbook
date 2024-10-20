docker build -t image_name .

docker run -d -p 3000:3000 image_name

docker ps

docker ps -a

docker start container_name

docker stop container_name 

docker rm container_name

docker rmi image_name

docker exec -it container_name bash

docker logs container_name

docker-compose up

docker-compose up -d

docker-compose down

docker-compose ps

docker-compose logs

docker-compose stop

docker volume ls

docker network ls

docker pull image_name

docker inspect container_name