sudo docker build -t venantvr/delete-that:v1 .
sudo docker run -it --env-file ./Environnements/env.prod -p 1234:1234 venantvr/delete-that:v1 bash


