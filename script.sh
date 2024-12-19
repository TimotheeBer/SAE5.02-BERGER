export ANSIBLE_HOST_KEY_CHECKING=False

#ansible-playbook  -i inventaire.ini --user root --extra-vars 'ansible_user=root ansible_password=root ansible_sudo_pass=root' update_manager.yml --ssh-extra-args="-o ControlMaster=auto -o ControlPersist=no"
#ansible-playbook  -i inventaire.ini --user root --extra-vars 'ansible_user=root ansible_password=root ansible_sudo_pass=root' monitoring_server.yml --ssh-extra-args="-o ControlMaster=auto -o ControlPersist=no"
ansible-playbook -i inventaire.ini --user root --extra-vars 'ansible_user=root ansible_password=root ansible_sudo_pass=root' incident_manager.yml --ssh-extra-args="-o ControlMaster=auto -o ControlPersist=no"

tail -f /dev/null
