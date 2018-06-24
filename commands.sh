export HISTCONTROL=ignorespace
cd ~
apt update
apt install nano sudo s3fs -y
nano .passwd-s3fs
chmod 600 ~/.passwd-s3fs
mkdir s3.cloudmatica.com
s3fs s3.cloudmatica.com s3.cloudmatica.com
