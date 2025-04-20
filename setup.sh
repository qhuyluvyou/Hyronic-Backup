#!/bin/bash
set -e

echo "🔒 Adding ngrok GPG key..."
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
sleep 3

echo "📝 Adding ngrok repository..."
echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
sleep 3

echo "🔄 Updating and upgrading system packages..."
sudo apt-get update && sudo apt-get upgrade -y
sleep 3

echo "📦 Installing necessary packages..."
sudo apt install openjdk-17-jdk ufw ngrok screen unzip p7zip-full neofetch btop wget curl git
sleep 3

echo "📂 Creating directory 'Main'..."
mkdir Main
sleep 3

echo "🔑 Configuring ngrok with your authtoken..."
ngrok config add-authtoken 2vdMOMVtUzE8YQdfAsZ5c8iEIlb_3Zd7ta8rurs6UVJZgg3bh
sleep 3

echo "🕒 Sleeping for 5 seconds..."
sleep 5

echo "🌍 Downloading PaperMC jar file..."
wget -O ~/Main/paper.jar https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/196/downloads/paper-1.20.1-196.jar
sleep 3

echo "✍️ Creating startup script..."
touch ~/Main/startup.sh
echo "java -Xms50G -Xmx50G -jar ~/Main/paper.jar -o true --nogui" >> ~/Main/startup.sh
sleep 3

echo "📜 Adding alias for easy startup command..."
echo "alias qhuy='bash ~/Main/startup.sh'" >> ~/.bashrc && source ~/.bashrc
sleep 3

echo "🔧 Setting Java 17 as default..."
sudo update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java
sleep 3

echo "🚀 Cloning Hyronic-Backup repository..."
git clone https://github.com/qhuyluvyou/Hyronic-Backup.git Server/
sleep 3

echo "📦 Copying Main folder contents to Server directory..."
cp -rf ~/Main/* Server/.
sleep 3

echo "🔒 Changing permissions for startup script..."
cd Server
chmod +x ~/Server/startup.sh
sleep 3

echo "⚡ Re-sourcing bashrc..."
source ~/.bashrc
sleep 3

echo "📦 Unzipping spawn.zip..."
unzip spawn.zip
sleep 3

echo "🗑️ Removing Git repository files..."
rm -rf .git
sleep 3

echo "🚀 Starting ngrok tunnel..."
screen -dmS tunnel ngrok tcp 11611
sleep 3

echo "🎉 Setup complete! Now restart your terminal (or run source ~/.bashrc) and summon your mighty server with 'qhuy'"
