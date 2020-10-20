#!/bin/bash
cd /opt/

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install -y wget

sudo wget https://raw.githubusercontent.com/slteksystemsllc/logstash/main/scripts/prereq.sh && sudo bash prereq.sh

sudo wget https://raw.githubusercontent.com/slteksystemsllc/logstash/main/scripts/initialize.sh && sudo bash initialize.sh

cd /usr/share/logstash/

docker-compose up --no-start

