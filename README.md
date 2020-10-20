# Logstash Development and Test Enviroment Using Docker Container

This is a Logstash docker container for configuration testing prior to moving configs into production

### Initial Goal

Make it simple to test and modify Logstash configurations and grok patterns as you test various logs using Docker to orchestrate.


## Prerequisites
Assume you have a copy of Ubuntu 18.04 minimum insatalled.  Have not tested this on other Linux distros but doesnt stop you from trying it out

```#Assumes you have downloaded and installed Ubuntu 18.04 minimum to start. Follow the rest of the steps below to configure and get up and running

# Once Ubuntu is insalled run update and upgrade commands to update system
sudo apt-get update && sudo apt-get upgrade


# Install wget
sudo apt-get install -y wget

# Change to the working directory /opt
cd /opt

# Download the prerequisites script and run in bash
sudo wget https://github.com/slteksystemsllc/elastic_stack/raw/master/scripts/prereq.sh && sudo bash prereq.sh

# Download the initialization script and run in bash
sudo wget https://github.com/slteksystemsllc/elastic_stack/raw/master/scripts/initialize.sh && sudo bash initialize.sh

# Navigate to /opt/elastic_stack/ and run the following command.  This will start the stack in daemon mode.
cd /opt/elastic_stack/
sudo docker-compose up -d


```
