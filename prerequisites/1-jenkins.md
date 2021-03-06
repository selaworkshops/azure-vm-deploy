# Deploy Jenkins on Azure (using azure cli)
---

- Login to your account
```
az login
```

- Set azure cli to use the desired subscription
```
az account set --subscription ${YOUR_SUBSCRIPTION_ID}
```

- Create a file named "cloud-init-jenkins.txt" with the content below:
```
#cloud-config
package_upgrade: true
runcmd:
  - apt install openjdk-8-jdk -y
  - wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
  - sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  - apt-get update && apt-get install jenkins -y
  - service jenkins restart
```

- Create a resource group for Jenkins
```
az group create \
--name jenkins-cicd \
--location westeurope
```

- Create a virtual machine with Jenkins instaled on it
```
az vm create \
--resource-group jenkins-cicd \
--name jenkins \
--image UbuntuLTS \
--admin-username "azureuser" \
--generate-ssh-keys \
--custom-data cloud-init-jenkins.txt
```

- Verify the creation (and state) of the new virtual machine
```
az vm list -d -o table --query "[?name=='jenkins']"
```

- By default, Jenkins runs on port 8080. Therefore, open port 8080 on the new virtual machine
```
az vm open-port \
--resource-group jenkins-cicd \
--name jenkins  \
--port 8080 --priority 1010
```

- Get the public IP address for the Jenkins virtual machine
```
az vm show \
--resource-group jenkins-cicd \
--name jenkins -d \
--query [publicIps] \
--output tsv
```

- Using the IP address retrieved in the previous step, SSH into the virtual machine
```
ssh azureuser@<ip_address>
```

- Verify that Jenkins is running by getting the status of the Jenkins service
```
service jenkins status
```

- Get the autogenerated Jenkins password.
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

- Install terraform
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
```
sudo apt-get update && sudo apt-get install terraform
```
```
terraform version
```

- Install azure cli
```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

- Using the IP address, browse to jenkins to finsish the configuration
```
http://<ip_address>:8080    
```
