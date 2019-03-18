# DC/OS on Aliyun

**Prerequisites**
- Aliyun account
- bootstrap node
- DC/OS binary

**Generate DC/OS binaries**  
Use bootstrap node to create and upload DC/OS files  

1. Login to bootstrap node
2. Create install bundle using the appropriate `config.yaml`
3. Copy files to Aliyun Object Storage
4. Update ROS to use new bootstrap location

**Installing Aliyun OSS Command**  
CLI tool to simplify uploading of files

1. `wget http://aliyun_portal_storage.oss.aliyuncs.com/oss_api/OSS_Python_API_20121010.tar.gz?spm=5176.383663.0.63.1TZLsE&file=OSS_Python_API_20121010.tar.gz`
2. `mv OSS_Python_API_20121010.tar.gz\?spm\=5176.383663.0.63.1TZLsE OSS.tar.gz`
3. `tar zxvf OSS.tar.gz`
4. `sudo mv osscmd /usr/local/bin`
5. `sudo cp -R oss /usr/lib/python2.7/site-packages`

**Notes**
- The region you are deploying into must support the instance types specified
- This template has been tested in China (Beijing)

