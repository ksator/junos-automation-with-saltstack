

# SaltStack files Structure: 

## salt master: 

The salt-master is configured via the master configuration file: https://docs.saltstack.com/en/latest/ref/configuration/master.html  
The configuration file for the salt-master is located at ```/etc/salt/master``` by default. 

### file_roots: 
Salt runs a file server to deliver files to minions.  
This file server is built into the master daemon and does not require a dedicated port.  
Default location is ```/srv/pillar```.  
Configured via the ```file_roots``` option inside the master configuration file.  

### pillar: 
The default location for the pillar is in ```/srv/pillar```.  
The pillar location can be configured via the ```pillar_roots``` option inside the master configuration file. 
sls files.  
the pillar has a top file. 

### state files: 
SLS (SaLt State) files.  
yaml format.  
representation/description of the state in which a system should be in.   
kind of ansible playbooks.  

## salt-minion:  
the salt-minion is configured via the minion configuration file.
By default, the salt-minion configuration will be in ```/etc/salt/minion```.

## salt-proxy:  
Proxy minions can now be configured in ```/etc/salt/proxy``` or ```/etc/salt/proxy.d``` instead of just pillar. 
Configuration format is the same as it would be in pillar.

## Reactor:  
Reactor sls files should be placed in the ```/srv/reactor/``` directory for consistency between environments, but this is not currently enforced by Salt.
Reactor sls files follow a similar format to other sls files in Salt.  
Reactor SLS files are mapped to event in the master conf file ```/etc/salt/master``` or ```/etc/salt/master.d/reactor.conf```
support for ```salt://``` file paths.  

# Execution of arbitrary commands
```
# salt ex4200-7 junos.facts
```
```
# salt ex4200-7 grains.items
```
```
# salt "ex*" pillar.items
```
# flexible targeting system: 

```
salt 'ex*' test.ping
```
```
salt -N group1 test.ping
```
```
salt -G 'os_family:junos' junos.cli "show version"
```
# Display return data in various format
```
salt -G 'os_family:junos' junos.cli "show version"
```
```
salt -G 'os_family:junos' junos.cli "show version" --output=yaml
```
```
salt -G 'os_family:junos' junos.cli "show version" --output=json
```

