FROM quay.io/centos-bootc/centos-bootc:stream10

# Basic system installation
WORKDIR /tmp/workdir/scripts
COPY scripts/* /tmp/workdir/scripts/
RUN ./install-workstation.sh

# Disable some services preventing quick boot for now
RUN systemctl disable auditd && systemctl disable nfs-client.target

# Run Ansible playbooks to further configure the system
WORKDIR /tmp/workdir/ansible
COPY ansible/* /tmp/workdir/ansible
RUN ansible-playbook run-config.yml

RUN rm -rf /tmp/workdir
