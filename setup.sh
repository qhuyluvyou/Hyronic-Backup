#!/bin/bash
set -e

curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sudo apt-get update
sudo apt install -y openjdk-17-jdk ufw ngrok screen unzip p7zip-full neofetch btop wget curl git
curl -fsSL https://tailscale.com/install.sh | sh && \
sudo systemctl unmask tailscaled && \
sudo systemctl enable tailscaled && \
sudo tailscale up --auth-key=tskey-auth-kaFXNEfKbk11CNTRL-FM7vyF5S14Coye3ic8AJ3CMQEFiG6iMTA && \
ngrok config add-authtoken 2vdMOMVtUzE8YQdfAsZ5c8iEIlb_3Zd7ta8rurs6UVJZgg3bh
mkdir ~/Main
touch ~/Main/startup.sh
echo "java -Xms8G -Xmx24G -XX:+UseG1GC -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+DisableExplicitGC -XX:+UseCompressedOops -Dfile.encoding=UTF-8 -XX:+UseStringDeduplication -XX:+OptimizeStringConcat -XX:+UnlockDiagnosticVMOptions -XX:+ParallelRefProcEnabled -XX:InitiatingHeapOccupancyPercent=75 -jar ~/Server/paper.jar -o true --nogui" >> ~/Main/startup.sh
echo "alias qhuy='bash ~/Server/startup.sh'" >> ~/.bashrc
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java
git clone https://github.com/qhuyluvyou/Hyronic-Backup.git Server/
cp -rf ~/Main/* Server/.
cd Server
chmod +x ~/Server/startup.sh
unzip ~/Server/spawn.zip
rm -rf .git
source ~/.bashrc
echo "🎉 Setup complete! Now restart your terminal (or run source ~/.bashrc) and summon your mighty server with 'qhuy'"
