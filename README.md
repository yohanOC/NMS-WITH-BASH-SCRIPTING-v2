# NMS-WITH-BASH-SCRIPTING-v2
Script using for send message to telegram when syslog find anomaly message

This is simple scripting for NMS using bash scrip. requirement for running this script as below
1. linux system
2. curl package
3. crontab package
4. boot telegram
5. create keyword file
6. create devices list
7. create running file for running every second and more real time

step 2 (install curl packate)
1. sudo apt-get update #for ubuntu system
2. sudo apt-get install curl  #curl installation
3. curl --version # verify install of curl on ubuntu
4. #for detail you can visit below link
https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/

step 3 (install crontab package)
1. sudo apt-get update # for ubuntu system
2. sudo aot-get install cron #cron installation
3. sudo systemctl enable cron #make cure cron already running
4. #how to configure cron for automation task you can visit below link
https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-ubuntu-1804

step 4 (create boot telegram)
1. first you must have an telegram account
2. then visit below link for detail instruction
https://core.telegram.org/bots/api
https://core.telegram.org/bots

step 5 
1. create keywoard list for example "flap" ect

step 6
1. create devices list, the conten of devices list must be similiar with file on syslog server where your save syslog message from your devices

step 7
1. add permision for running file with "chmod x /home/running.sh"
2. configure on nohoop with this command " nohup ./send_message.sh & "


