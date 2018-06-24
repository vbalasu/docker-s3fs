# docker-s3fs

Docker container that uses s3fs to connect to s3.cloudmatica.com (S3 bucket)

To launch this container, type the following commands from your home directory. 
If you are doing this in Windows, do it from your docker quickstart terminal

~~~~
git clone https://vbalasu@bitbucket.org/vbalasu/docker-s3fs.git
cd docker-s3fs
./ubuntu_mount.sh
~~~~

(Type the following commands within the new container)
~~~~
cd ~
cp userhome/docker-s3fs/commands.sh .
cat commands.sh
~~~~
Now execute the commands in commands.sh one by one
You can now access s3.cloudmatica.com as though it is a local folder