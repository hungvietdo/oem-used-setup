### Instruction on how to setup OEM-USED site

##### Update your local hosts file (/etc/hosts)
Add this: `www.bobcatused.com 127.0.0.1`
Clone `git@github.com:traderinteractive/oem-used.git` to `projects/` folder
copy your `id_rsa` to `secret/`
##### Build container
`docker-compose build --no-cache oem-used`
##### Bring up the service
`docker-compose up -d oem-used`
##### Setup from inside the container
Get into the container: `docker exec -it containerId /bin/bash`
` - cd /root/.ssh`
`` - eval `ssh-agent -s` ``
`- ssh-add rsa_id `
Build project:
`- cd /oem-used && php build.php`
Run facade:
`cd /oem-used/facade && node server.js`
##### Testing the site
From browser open the page http://www.bobcatused.com/. It should work as expected.

