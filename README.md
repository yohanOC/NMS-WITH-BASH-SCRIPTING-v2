# NMS-WITH-BASH-SCRIPTING-v2
Script for send message to telegram when syslog find anomaly message

This is simple scripting for NMS using bash scrip. requirement for running this script as below
1. linux system
2. curl package
3. crontab package
4. boot telegram

step 1 (install curl packate)
1. sudo apt-get update #for ubuntu system
2. sudo apt-get install curl  #curl installation
3. curl --version # verify install of curl on ubuntu
4. #for detail you can visit below link
https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/

step 2 (install crontab package)
1. sudo apt-get update # for ubuntu system
2. sudo aot-get install cron #cron installation
3. sudo systemctl enable cron #make cure cron already running
4. #how to configure cron for automation task you can visit below link
https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804

step 3 (create boot telegram)
1. first you must have an telegram account
2. then visit below link for detail instruction
https://core.telegram.org/bots/api
https://core.telegram.org/bots

