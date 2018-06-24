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


------------

The overall steps are as follows:
~~~~
Create an IAM user: s3fs_user
Create an s3 bucket: s3.cloudmatica.com
Create a bucket policy that gives s3fs_user full S3 access to the bucket and its contents
Create an Ubuntu EC2 instance
In the home directory create a folder named s3.cloudmatica.com
In IAM create access key and secret for s3fs_user
In the EC2 instance, create ~/.passwd-s3fs and store KEY:SECRET
Set permissions as follows: sudo chmod 600 ~/.passwd-s3fs
Install s3fs as follows: sudo apt-get install s3fs
Mount the bucket as follows: s3fs s3.cloudmatica.com s3.cloudmatica.com
Test by storing a file in s3.cloudmatica.com
See here for more details: https://github.com/s3fs-fuse/s3fs-fuse

Bucket Policy
{
    "Id": "Policy1529554222900",
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1529553579136",
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::s3.cloudmatica.com",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::251566558623:user/s3fs_user"
                ]
            }
        },
        {
            "Sid": "Stmt1529554215266",
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::s3.cloudmatica.com/*",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::251566558623:user/s3fs_user"
                ]
            }
        }
    ]
}

~~~~