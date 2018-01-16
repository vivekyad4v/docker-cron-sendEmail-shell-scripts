[![LinkedIn](https://github.com/vivekyad4v/public-images/raw/master/generic/LinkedIn-vivekyad4v.png)](https://www.linkedin.com/in/vivekyad4v/)  &nbsp;   &nbsp;   [![Build Status](https://travis-ci.org/vivekyad4v/docker-cron-sendEmail-shell-scripts.svg?branch=master)](https://travis-ci.org/vivekyad4v/docker-cron-sendEmail-shell-scripts)

# docker-cron-sendEmail-shell-scripts
Run shell scripts as Cronjobs in single Docker container, Optionally use sendEmail to send emails. You can define multiple shell scripts & crontabs. This supports both `sh` & `bash` shell.

##### Tech Stack - Alpine, Docker, Docker-compose
<a href="https://github.com/vivekyad4v?tab=followers"><img align="right" width="200" height="183" src="https://s3.amazonaws.com/github/ribbons/forkme_left_green_007200.png" /></a>

### Put your scripts (scripts/)

- Put all your shell scripts in `scripts` folder.

### Define crontab for your scripts (install_crontab.txt)

- Define the crontabs for your scripts in `install_crontab.txt` file
```sh
*/30 * * * * /sh-script.sh >> /var/log/cron.log
*/5 * * * * /bash-script.sh >> /var/log/cron.log
```

### Build & run your docker container
```sh
$ docker build -t cron-sendemail .
$ docker run --name cron-sendemail --restart always -dt cron-sendemail
```

### Using docker-compose  
```sh
$ docker-compose build
$ docker-compose up -d
```
### Logs - Whatever you/script write to "/var/log/cron.log" will get redirected to your container logs 
```sh
$ docker logs cron-sendemail 

crond: crond (busybox 1.27.2) started, log level 8
crond: USER root pid   7 cmd /sh-script.sh >> /var/log/cron.log
crond: USER root pid   9 cmd /bash-script.sh >> /var/log/cron.log
this is a sh script, ran on Tue Jan 16 10:03:00 UTC 2018
This is a bash script, ran on Tue Jan 16 10:03:00 UTC 2018
```

### sendEmail - SMTP client (This docker image will have sendEmail installed), you can use this optionally in your shell scripts - 

```sh
$ export FROM_EMAIL=from-address@gmail.com           ## From addess & user email for authentication
$ export TO_EMAIL=vivekyad4v@gmail.com
$ export PASSWD_EMAIL=ab12345678
$ export SMTP_EMAIL="smtp.gmail.com:587"
$ export SUBJECT_EMAIL="This should be the email subject"
$ export CONTENT_EMAIL="This is the content/body of email"      ## You can give file as a content
$ sendEmail -u $SUBJECT_EMAIL -m $CONTENT_EMAIL -f $FROM_EMAIL -t $TO_EMAIL -s $SMTP_EMAIL -o tls=yes -xu $FROM_EMAIL -xp $PASSWD 
```

ToDo - Improving sendEmail usage.

If this helps, Fork & Star it :)
