
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

