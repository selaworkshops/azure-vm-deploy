# Configure a Jenkins Slave

See: https://gitlab.com/sela-devops/courses/jenkins-cicd/lab-01

## Install Java

- Install Java 8
```
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
```

- Test installation
```
java -version
```

## Configure Slave

- Create a new folder to be used for the Jenkins slave:

```
$ sudo mkdir /home/jenkins
$ sudo chmod 777 /home/jenkins
```

 - Configure Credentials via the **jenkins portal**:
 
```
"Manage Jenkins" → "Manage Credentials" → "Jenkins" → "Global credentials (unrestricted) → Add Credentials"
```

 - Enter the following details:
 
```
    Kind        - username with password		
 	Scope       - Global...
 	Username    - azureuser
 	Password    - !QAZ2wsx3edc	
 	ID          - yourname-yourlastname-server-credentials
 	Description - server credentials for yourname
```
 
 - Configure the server as a jenkins slave, start creating a new node in the **jenkins portal**:

```
"Manage Jenkins" → "Manage Nodes" → "New Node"
Set "Slave" as name and select "Permanent Agent"
```
 
 - Configure the slave with the details below:

```
number of executors: 1
Remote root directory: /home/jenkins
Labels: yourname-yourlastname
Usage: only build jobs with label expressions matching this node
Launch method: Launch agent agents via SSH
Host: <your-server-ip>
Credentials: azureuser/*****
Host Key Verification Strategy: Non verifying Verification Strategy
```

 - Click "Save" and wait a minute to ensure that the slave is up and running (click "refresh status")

 - If you get some issues at this point, click on the node name and inspect the logs
