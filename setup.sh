#!/bin/bash
set -e
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \

sudo apt-get update && sudo apt-get upgrade -y && sudo apt install openjdk-17-jdk ufw ngrok screen unzip p7zip-full neofetch btop wget curl git

mkdir Main

ngrok config add-authtoken 2vdMOMVtUzE8YQdfAsZ5c8iEIlb_3Zd7ta8rurs6UVJZgg3bh
sleep 5

wget -O ~/Main/paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar
touch ~/Main/startup.sh
echo "java -Xms50G -Xmx50G -jar ~/Main/paper.jar -o true --nogui" >> ~/Main/startup.sh
echo "alias qhuy='bash ~/Main/startup.sh'" >> ~/.bashrc && source ~/.bashrc
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java
git clone https://github.com/qhuyluvyou/Hyronic-Backup.git Server/
cp -rf ~/Main/* Server/.
cd Server
chmod +x ~/Server/startup.sh
source ~/.bashrc
unzip spawn.zip
rm -rf .git
screen -dmS tunnel ngrok tcp 11611
sleep 5

echo "Done :3, restart your shell session and start server with 'qhuy'"
