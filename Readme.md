# Intro
With this dockerfile it's possible to run the Chaos license server in a container. This only works with online licensing, not with dongles. 

# Setup & Build
Because of restrictions you have build the image yourself.
- Login to your Chaos acount and download the Chaos license server for linux. Place it in root with the Dockerfile.

- Create a JSON file called chaos_cred.json with the 
following content:

    `
    {
    "username": "YOUR_CHAOS_ACOUNT",
    "password": "YOUR_CHAOS_PASSWD"
    }
    `

    And place it in the root next to the Dockerfile and license server binary. This file is copied into the container to activate the server.

In the end you should have a directory with the following files:

* cgls_lin_*.bin
* chaos_cred.json
* Dockerfile
* startup.sh

Now you should be able to build the image:
* within a terminal cd into the directory containing above files
* execute: `docker build -t chaosgroup-ls .`
* at the time of creation the current Chaos license server is version is 5.5.5 so this version is used as the default. If you've downloaded a different version you can use the CGLS_BIN build argument.

    `docker build -t chaosgroup-ls --build-arg CGLS_BIN=cgls_lin_5.5.5.bin .`

 
After this you can run the container with

`docker container run  -p 30304:30304  chaosgroup-ls`

# Issues
* At the moment the server activates with the Chaos acount with every restart of the container. Not a big deal but it would be nice to be able to delete the credentials file after inital activation.

