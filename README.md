# About this repo
how to automate Junos with SaltStack

# About SaltStack

SaltStack is an event driven infrastructure tool (like StackStorm), with good network automation capabilities.  
- SaltStack is the company.    
- Salt Open is the open source tool I am using in this repo.  
- SaltStack Enterprise is the software they sell and support.   

Salt is a remote execution tool and configuration management system: 
- remote execution:  run commands on various machines in parallel with a flexible targeting system (salt execution modules)
- configuration management: establishes a client-server model to bring infrastructure components in line with a given policy (salt state modules)

Written in Python  
open source (https://github.com/saltstack).   
https://saltstack.com/  

# SaltStack competition  
Salt competes primarily with Puppet, Chef, Ansible, and StackStorm.  
ansible vs saltstack vs stackstorm: https://medium.com/@anthonypjshaw/ansible-v-s-salt-saltstack-v-s-stackstorm-3d8f57149368  

# SaltStack architecture: 
Client server model: minions and master.  
proxy: enables master to control devices without minion. Examples include:  
- devices that could run a minion, but for whatver reasons, don't.
- devices that cannot run a standard salt-minion
- devices with limited CPU or memory
- IoT

# Junos automation with Saltstack

SaltStack supports Junos automation with a Junos proxy: 
- it provides execution modules and state modules for junos.  
- Junos proxy controls junos devices without installing salt on device. There is no salt-minion.  
- It uses Junos API (pyez and netconf).  
- Junos facts are stored in grains.  
- Apart from that there is a junos syslog engine.
 - listens to syslog events 
 - extracts event information 
 - sends it on the master/minion event bus.
 - Control the type of events to be sent.
 - Salt reactors has the ability to take actions according to these events (event driven automation).

Salt supports also Napalm (Network Automation and Programmability Abstraction Layer with Multivendor support). So you can also use it to automate Junos.  

# SaltStack versions: 
https://docs.saltstack.com/en/latest/topics/releases/version_numbers.html  
https://en.wikipedia.org/wiki/List_of_chemical_elements

# SaltStack installation: 
Nitrogen has a better network automation support than Carbon.   
Nitrogen should be available on pypi https://pypi.python.org/pypi by July 2017. 
At that time you will be able to install Nitrogen using
```
pip install salt
```
Meanwhile, you can install Nitrogen from the salt github repository (https://github.com/saltstack/salt) using the branch 2017.7:  
```
pip install git+https://github.com/saltstack/salt.git@2017.7
```
```
# salt --version
salt 2017.7.0-202-g3c8dee0 (Nitrogen)
```

# SaltStack files Structure: 

## salt master: 

### The salt-master is configured via the master configuration file. 
https://docs.saltstack.com/en/latest/ref/configuration/master.html
The configuration file for the salt-master is located at /etc/salt/master by default. 

### file_roots: 
Salt runs a file server to deliver files to minions. This file server is built into the master daemon and does not require a dedicated port.
Default location is /srv/pillar.

### pillar: 
The default location for the pillar is in /srv/pillar.
The pillar location can be configured via the pillar_roots option inside the master configuration file. 
sls files. 
the pillar has a top file. 

### state files: 
sls files in yaml format
kind of ansible playbooks

## salt-minion
the salt-minion is configured via the minion configuration file.
By default, the salt-minion configuration will be in /etc/salt/minion.

## salt-proxy
Proxy minions can now be configured in /etc/salt/proxy or /etc/salt/proxy.d instead of just pillar. Configuration format is the same as it would be in pillar.

## Reactor 
Reactor sls files should be placed in the /srv/reactor/ directory for consistency between environments, but this is not currently enforced by Salt.
Reactor sls files follow a similar format to other sls files in Salt. By default they are written in YAML and can be templated using Jinja
Reactor SLS files are mapped to event in the master conf file /etc/salt/master or /etc/salt/master.d/reactor.conf
support for salt:// file paths.

