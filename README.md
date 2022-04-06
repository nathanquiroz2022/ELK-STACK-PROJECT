# ELK-STACK-PROJECT
CYBERSECURITY BOOTCAMP FILES AND SCRIPTS
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![RESOURCE_GROUP](https://user-images.githubusercontent.com/102634215/161407961-9841a08e-5960-44f3-94a9-4586e37be89f.png))

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YMLfile may be used to install only certain pieces of it, such as Filebeat.
# PLAYBOOK/CONFIGURATION FILES
 
- [Filebeat](https://1drv.ms/u/s!AqQrhCo0x9tgniLUIQpJDVrDH0sy?e=gVnxVqm)
- [Metricbeat](https://1drv.ms/u/s!AqQrhCo0x9tgnh7iUAkj3ZOFKQ9s?e=3hxEsK)
- [ELK-server](https://1drv.ms/u/s!AqQrhCo0x9tgniDqbQK0K1wnJhW1?e=bork6Q)
- [my-playbook](https://1drv.ms/u/s!AqQrhCo0x9tgniFhLR7zpeKXtM7V?e=VH8o00)
- [Metricbeat-Config](https://1drv.ms/u/s!AqQrhCo0x9tgnjvUliHke9jdrY4a?e=nxHsk0)
- [Filebeat-Config](https://1drv.ms/u/s!AqQrhCo0x9tgnidftWsF6fr-hjoT?e=9ZWo8G)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly stable, in addition to restricting access to the network. 
- Load balancers improve application availability and responsiveness and prevent server overload.Load balancer defends an organization against distributed denial-of-service (DDoS) attacks 
- When a jump box is used, its hidden benefit is that any tools in place for the SAN system are maintained on that single system. Therefore, when an update to the SAN management software is available, only a single system requires the update. A Jump Box Provisioner is also important as it prevents Azure VMs from being exposed via a public IP Address.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing
- Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function    | IP Address     | Operating System |
|----------|-------------|----------------|------------------|
| Jump Box | Gateway     | 10.0.0.4       | Linux            |
|          |             | 20.36.35.14    |                  |
|          |             |                |                  | 
| Web-1    |UbuntuServer | 10.0.0.5       | Linux            |
|          |             | 20.213.236.135 |                  |  
|          |             |                |                  |
| Web-2    |Webserver    | 10.0.0.6       | Linux            |
|          |             | 20.213.236.138 |                  |
|          |             |                |                  | 
| elkvm    | MONITOR     | 10.1.0.5       | Linux            |
|          |             | 20.53.225.227  |                  | 
|          |             |                |                  |
______________________________________________________________ 

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Workstation Public IP ---through---> TCP Port 5601

Machines within the network can only be accessed by workstation and jumpbox provisioner through SSH.
- Which machine did you allow to access your ELK VM? What was its IP address?
   - Jumpbox Provisioner IP 10.1.0.5 via ssh port 22
- What was its IP address?
   - Workstation My Public IP via port TCP 5601


A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses                              |
|-------------|---------------------|---------------------------------------------------|
|Jump Box     | Yes                 | 20.36.35.14 (Workstation IP on ssh 22)            |
|             |                     |                                                   |
|Web-1        | No                  | 10.0.0.5 on ssh 22                                |
|             |                     |                                                   |
|Web-2        | NO                  | 10.0.0.5 on ssh 22                                |    
|             |                     |                                                   |     
|ELKserver    | NO                  | Workstation MY Public IP using TCP 5601           |   
|             


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

  - The main advantage of automating configuration with Ansible are as follows: 
  ADVANTAGES OF ANSIBLE:

	- Open Source Tool
	- Ansible is an opensource tool without any paid licence needed and it can be used as free of cost.

	- Simple Configuration Management
	- Ansible can manage easily and learn easily. The shell scripts are simple and no need for any other software installed.

	- Application Development
	- It can easily deploy multi-tier applications. There is no need to configure applications on every machine, you have to only specify the tasks in the        playbook. When we run the playbook, then it will automatically run the tasks in the playbook to each host machine through SSH.

	- The Playbooks are Written in YAML
	- The playbooks are Ansible configuration files that are written in YAML and use of it makes the Ansible better by configuration and automation tool.

	- No Agents Required
	- There is no need of agents or software when you want to automate with the client system or hosts.

	- Cloud Provisioning
	- By using Ansible we can cloud platforms and virtualized hosts , network devices etc.




The playbook implements the following tasks:
- 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc.
-  Specify a different group of machines:
     - 
         - name: Config elk VM with Docker
           hosts: elk
           become: true
           tasks:

- Install Docker.io
     -   
         - name: Install docker.io
           apt:
           update_cache: yes
           force_apt_get: yes
           name: docker.io
           state: present
     
- Installs Python3-pip
     - 
         - name: Install python3-pip
           apt: 
           force_apt_get: yes 
           name: python3-pip 
           state: present 
     
- Use pip module (It will default to pip3)
     -  
         - name: Install Docker module
           pip:
           name: docker
           state: present
           `docker`, which is the Docker Python pip module.      
	   
- Increase Virtual Memory
     -      
            - name: Use more memory
              sysctl:
              name: vm.max_map_count
              value: '262144'
              state: present
              reload: yes
	  
- Download and Launch ELK Docker Container (image sebp/elk)
    -   
        - name: Download and launch a docker elk container
          docker_container:
          name: elk
          image: sebp/elk:761
          state: started
          restart_policy: always

- Published ports 5044, 5601 and 9200 were made available
     -   
         - published_ports:
         -  5601:5601
         -  9200:9200
         -  5044:5044   
          


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
ELK SERVER
![ELK_SERVER](https://1drv.ms/u/s!AqQrhCo0x9tgnWVn9rcJqmRB3Fh7?e=cK54lM)
### JBOX:
(![image](https://user-images.githubusercontent.com/102634215/161841311-582a80ae-e450-499d-99be-cf21dc84b076.png)

### ELK-SERVER

![image](https://user-images.githubusercontent.com/102634215/161841965-5fb6b5d4-62b6-41c8-bf69-f10e3afc79dc.png)

### WEB-1

![image](https://user-images.githubusercontent.com/102634215/161843083-df660a43-283e-4c23-9324-d894fc096563.png)

### WEB-2

![image](https://user-images.githubusercontent.com/102634215/161843283-107179f0-8c82-4b1f-991e-ba47aec45408.png)


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
  List the IP addresses of the machines you are monitoring
  - Web-1: 10.1.0.5
  - Web-2: 10.1.0.6

We have installed the following Beats on these machines:
   - [Filebeat_module_status](https://user-images.githubusercontent.com/102634215/161406065-c747293c-e6b6-4d4e-aa97-4090d91dc76a.png)
   - [Metricbeat_module_status](https://user-images.githubusercontent.com/102634215/161406099-ba73d187-b7f2-4b8e-9e25-1fb437778c6d.png)

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat will be used to collect log files from specfic files in particular
Apache, Mircosoft Azure tools and web servers, MySQL databases
#[screeshoot of filebeat module kibana dashboard]#
- [Filebeat_syslog_Dashboard](https://user-images.githubusercontent.com/102634215/161449139-d46261ed-3d5c-4cde-b33f-e35139ef399f.png)

- [Metricbeat_Docker_overview_Dashboard](https://user-images.githubusercontent.com/102634215/161450584-7889b1fb-76fc-43be-bb23-18d9849c002e.png)

Metricbeat will be used to monitor VM stats, per cpu core stats, per filesystem stats, memory stats and network stats
#[screenshot of Kibana Docker containers[metricbeat docker] ecs]#
#[screenshot of Kibana Host overview[metricbeat docker-web-1] metrics]
#[screenshot of Kibana Host overview[metricbeat docker-web-2] metrics]
- [Metricbeat_Kibana_Docker_Host_Web-1_and_Web-2_Overview_and_Container_ECS]
   -[screenshot](https://user-images.githubusercontent.com/102634215/161451597-0d670cea-40bb-41ea-a343-c6220f643cd1.png)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

Verify the Public IP address to see if it has changed. [What Is My IP](https://www.whatismyip.com/)?
If changed then update the Security Rules that uses the My Public IPv4

SSH into the control node and follow the steps below:
- Copy the YML file to ansible folder.
- Update the config file to include remote user and port
- Run the playbook, and navigate to kibana((Users IP address):5601 to check that the installation worked as expected.

## Elk VM Configuration

- Run the playbook using this command : ansible-playbook /etc/ansible/install-elk.yml
- /etc/ansible/hosts file (IP of the Virtual Machines).

## For Filebeat
Download Filebeat playbook usng this command:
-
	- curl -L -O
		https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/filebeat-config.yml
       

- Copy the - [Filebeat-Config](https://1drv.ms/u/s!AqQrhCo0x9tgnidftWsF6fr-hjoT?e=9ZWo8G) Config file to /etc/ansible
- Update the filebeat-config.yml file to include the ELK private IP 10.2.0.4 as below from root@9ddf6fe7eb3f:~# nano /etc/ansible/filebeat-config.yml
## Config-File
-       output.elasticsearch:
        Boolean flag to enable or disable the output module.
        enabled: true

       Array of hosts to connect to.
       Scheme and port can be left out and will be set to the default (http and 9200)
       In case you specify and additional path, the scheme is required: http://localhost:9200/path
       IPv6 addresses should always be defined as: https://[2001:db8::1]:9200
       hosts: ["localhost:9200"]
       username: "elastic"
       "changeme" # TODO: Change this to the password you set
       Starting with Beats version 6.0.0, the dashboards are loaded via the Kibana API.
       This requires a Kibana endpoint configuration.
       setup.kibana:
        host: "10.0.0.5:5601" #### TODO: Change this to the IP address of your ELK server

Run the playbook using this command ansible-playbook filebeat-playbook.yml and navigate to Kibana > Logs : Add log data > System logs (DEB) > 5:Module Status > Check Incoming data on Kibana to check that the installation worked as expected.


- How do I specify which machine to install the ELK server on versus which to install Filebeat on?
      -  I have specified two separate groups in the etc/ansible/hosts file. One of the group will be webservers which has the IPs of the 3 VMs that I will install Filebeat to. The other group is named ELKserver which will have the IP of the VM I will install ELK to.
      -  
- Which URL do you navigate to in order to check that the ELK server is running?
- (http://[20.53.225.227]:5601/app/kibana)
- ![image](https://user-images.githubusercontent.com/102634215/161406015-cf3fb6eb-1d3a-4f26-bd8f-fa97b6e5726b.png)


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._


|    COMMAND                                     |        RESULT                                  |
|------------------------------------------------|:----------------------------------------------:|
| ssh-keygen                                     | GENERATE A SSH KEY TO SET UP VM's              |
| sudo cat .ssh/id_rsa.pub                       | VIEW THE SSH PUBLIC KEY                        |
| ssh sysadmin@JBox-Provisioner IP address       | LOGGING INTO THE JBOX                          |
| sudo docker ps -a                              | VIEWING ALL THE ACTIVE/UNACTIVE CONTAINERS     |
| sudo docker start vigilant_bohr                | START UP THE CONTAINER                         |
| sudo docker attach vigilant_bohr               | SSH TO THE CONTAINER                           |
| cd /etc/ansible                                | NAVIGATE TO THE ANSIBLE FOLDER                 |
| nano /etc/ansible/hosts                        | NAVIGATE TO THE HOSTS CONFIG                   |
| nano /etc/ansible/ansible.cfg                  | NAVIGATE TO THE ANSIBLE CONFIG FILE            |
| ssh ansible@Web-1 IP address                   | SSH/LOG INTO WEB-1                             |
| ssh ansible@Web-2 IP address                   | SSH/LOG INTO WEB-2                             |
| ssh ansible@ELKserver IP address               | SSH/LOG INTO ELKSERVER                         |
| sudo apt-get update                            | UPDATE ALL PACKAGES                            |
| sudo apt install docker.io                     | INSTALL DOCKER APPLICATION                     |
| sudo service docker start                      | START UP DOCKER APPLICATION                    |
| sudo systemctl status docker                   | CHECK STATUS OF THE DOCKER APPLICATION         |
| http://ELK_IP_ADDRESS:5601//app/kibana         | NAVIGATE TO THE KIBANA SITE THROUGH PORT 5601  |
| nano filebeat-config.yml                       | EDIT FILEBEAT-CONFIG FILE                      |
| nano filebeat-playbook.yml                     | EDIT FILEBEAT PLAYBOOKM                        |
| nano metricbeat-config.yml                     | EDIT METRICBEAT-CONFIG FILE                    |
| nano metricbeat-playbook.yml                   | EDIT METRICBEAT PLAYBOOK                       |
---------------------------------------------------------------------------------------------------
