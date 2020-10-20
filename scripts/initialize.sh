#!/bin/bash
cd /opt/

git clone https://github.com/slteksystemsllc/logstash.git

#########################################################
# Logstash Pre-Config 

mkdir -p /usr/share/logstash/
mkdir -p /usr/share/logstash/bin/
mkdir -p /usr/share/logstash/config/
mkdir -p /usr/share/logstash/configs/
mkdir -p /usr/share/logstash/custom_patterns/
mkdir -p /usr/share/logstash/dictionaries/
mkdir -p /usr/share/logstash/persistent_data/
mkdir -p /usr/share/logstash/pipeline/
mkdir -p /usr/share/logstash/plugins/
mkdir -p /usr/share/logstash/rules/

sudo chown 1000:1000 -R /usr/share/logstash/

cp -r /opt/logstash/logstash/logstash_configs/* /usr/share/logstash/configs/
cp -r /opt/logstash/logstash/dictionaries/* /usr/share/logstash/dictionaries/
cp -f /opt/logstash/logstash/pipelines.yml.example /usr/share/logstash/config/pipelines.yml
cp -r /opt/logstash/logstash/rules/* /usr/share/logstash/rules/
cp -f /opt/logstash/docker-compose.yml.example /usr/share/logstash/docker-compose.yml

cd /usr/share/logstash/

docker-compose up --no-start
