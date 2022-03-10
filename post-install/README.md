# Introduction

The purpose of these playbooks are to automate end to end process to setup my `raspberry-pi` backup server. So that I can setup a daily `mysql` database schedule from a remote server.

In these playbooks we configure:
- Operating system `ubuntu` for `k3s`
- install `k3s` with volume mount (external hardrive connected to `raspberry-pi`).
- Install `awx`.
- Create a job template to run daily `mysql` backup.


## K3s Ansible Playbook

Build a Kubernetes cluster using Ansible with k3s. The goal is easily install a Kubernetes cluster on machines running:
- [X] Debian
- [X] Ubuntu
- [X] CentOS

on processor architecture:

- [X] x64
- [X] arm64 [our current setup]
- [X] armhf

### System requirements

Deployment environment must have Ansible 2.4.0+
Master and nodes must have passwordless SSH access

# Post install

### Config ansible host

Create a new directory based on the `sample` directory within the `inventory` directory:

```bash
cp -R inventory/sample inventory/geeky-server-build
```
**Note:**

Make sure to update:

- `server-ip` in `/inventory/geeky-server-build/hosts.ini` file.
- `ansible_user` in `/inventory/geeky-server-build/group_vars/all.yml` file.
- `remote_port` and `remote_user` in `/ansible.cfg` file.

### Config ansible global variables

Setup default values for ansible paybook

```bash
cp global_vars/example_awx_config_vars.yaml global_vars/awx_config_vars.yaml
```
**Note:**

- Make sure to update global variables.

## STEP 1 - Install `k3s` and `awx`

```bash
./step1-post-install.sh
```
Wait for 30-40 minutes to fully complete the process.

### Access `awx` GUI locally via port forwarding.

Login to your server and run following commands to:

**Get awx url**

```bash
echo "http://localhost:$(sudo k3s kubectl get service awx-service -n awx -o yaml | grep nodePort | awk '{print $2}' )"
```
**Get awx username:**

admin (by default)

**Get awx password**

```bash
echo $(sudo k3s kubectl get secret awx-admin-password -o jsonpath="{.data.password}" -n awx | base64 --decode)
```

## STEP 2 - Configure and schedule `awx` job

Once `awx` is up and running, create a port forwording to access awx locally, so that we can run awx cli.

```bash
ssh -L 8000:127.0.0.1:[AWX-PORT] [SERVER-USER]@[SERVER-IP] -p [SERVER-PORT]
```
Now open your web browser and paste `http://127.0.0.1:8000`. You should be able to view `awx` locally.

**Note:** 

Port forwording is require before running the `step2-post-install-config.sh` script to create `awx credential type` for database credentials. Awx collections has bug that unable to pass jinja variables in injectors.

### Create job template - Daily mysql database backup from remote server.

```bash
./step2-post-install-config.sh
```
Wait for 1-2 minutes to fully complete the process.

## Congratulations!!!!
You just completed the installation and congifration of an AWX instance :)
