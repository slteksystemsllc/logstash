# Logstash Development and Test Enviroment Using Docker Container

This is will install a Logstash docker container inside Ubuntu for configuration testing prior to moving configs into production.  You can run this and test pipelines and configs to verify they work the way you expect prior to migrating into a rpoduction system. 

If you wish to just run a single container not utilizing he docker-compose.yml you can do so as well by doing something like this

sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.2

sudo docker run -it --rm docker.elastic.co/elasticsearch/elasticsearch:7.9.2 -f /opt/logstash.conf (replace logstash.conf with your logstash test config)
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Example logstash.conf test file for pasting logs into logstash and seeing output on screen.  Copy the following text into a file 
```
sudo vi logstash.conf 
```
paste the following into your text editor (vim in this case)

```
input {
  stdin {}
}
output {
  stdout {
    codec => rubydebug
  }
}
```
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Than run the config with logstash in the conatiner using the following command
```
sudo docker run -it --rm docker.elastic.co/elasticsearch/elasticsearch:7.9.2 -f /opt/logstash.conf
```
This is really only for quick test etc.  

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
sudo wget https://raw.githubusercontent.com/slteksystemsllc/logstash/main/scripts/prereq.sh && sudo bash prereq.sh

# Download the initialization script and run in bash
sudo wget https://raw.githubusercontent.com/slteksystemsllc/logstash/main/scripts/initialize.sh && sudo bash initialize.sh

# Navigate to /usr/share/logstash/ and run the following command.  This will start the stack in daemon mode.
cd /usr/share/logstash/

sudo docker-compose up -d

## Or download this script and execute to do everything listed above in one shot

sudo wget https://raw.githubusercontent.com/slteksystemsllc/logstash/main/automated_install.sh

sudo bash automated_install.sh



```
