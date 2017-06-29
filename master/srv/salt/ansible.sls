ansible_playbook_execution:
  cmd.run:
    - name: ansible-playbook junos_get_config/pb.2.yml --extra-vars target={{ data['hostname'] }}
    - cwd: /srv/ansible/

