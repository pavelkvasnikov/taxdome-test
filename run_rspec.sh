#!/bin/bash
container=$(docker ps | grep taxdome-test_api | awk '{print $1}')
echo $(docker exec -it $container rspec spec --require rails_helper)
