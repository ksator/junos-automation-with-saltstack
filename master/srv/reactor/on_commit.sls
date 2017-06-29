Run ansible playbook:
  local.cmd.run:
    - tgt: minion_1
    - arg: 
        - ansible-playbook /srv/ansible/junos_get_config/pb.2.yml --extra-vars target={{ data['hostname'] }} -i /srv/ansible/hosts


