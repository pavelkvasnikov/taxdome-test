#!/bin/bash
container=$(docker ps | grep taxdome-test_api | awk '{print $1}')
echo $(docker exec -it $container rake db:create)
echo $(docker exec -it $container rake db:migrate)
echo $(docker exec -it $container rake db:seed)
