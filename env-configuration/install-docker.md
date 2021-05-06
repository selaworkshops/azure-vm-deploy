# Install Docker on Ubuntu 18.04

- Update the apt package index:
```
$ sudo apt-get update
```

 - Install packages to allow apt to use a repository over HTTPS:
```
$ sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
```

 - Add Docker’s official GPG key:
```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

- Use the following command to set up the stable repository:

```
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

 - Update the apt package index:
```
$ sudo apt-get update
```

 - Install the latest version of Docker CE:
```
$ sudo apt-get -y install docker-ce
```

 - Start the Docker daemon:
```
$ sudo systemctl start docker
```

 - Ensure that the Docker daemon will start after reboot:
```
$ sudo systemctl enable docker
```

 - Create the docker group (if it doesn't exist):
```
$ sudo groupadd docker
```

 - Add your user to the docker group (to be able to run docker without sudo):
```
$ sudo usermod -aG docker $USER
```

 - Restart the session to apply changes

 - Verify that you can run the following commands without sudo:
```
$ docker run --rm hello-world
```
