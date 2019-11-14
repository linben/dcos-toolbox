# DC/OS on Aliyun

**Prerequisites**
- Aliyun account
- bootstrap node
- DC/OS binary

**Generate DC/OS binaries**  
Use bootstrap node to create and upload DC/OS files  

1. Login to bootstrap node
2. Create install bundle using the appropriate `config.yaml`
3. Copy files to Aliyun Object Storage Service
4. Update ROS to use new bootstrap location

**Installing Aliyun OSS Command**  
CLI tool to simplify uploading of files

1. `wget http://aliyun_portal_storage.oss.aliyuncs.com/oss_api/OSS_Python_API_20121010.tar.gz?spm=5176.383663.0.63.1TZLsE&file=OSS_Python_API_20121010.tar.gz`
2. `mv OSS_Python_API_20121010.tar.gz\?spm\=5176.383663.0.63.1TZLsE OSS.tar.gz`
3. `tar zxvf OSS.tar.gz`
4. `sudo mv osscmd /usr/local/bin`
5. `sudo cp -R oss /usr/lib/python2.7/site-packages`

**Create OSS bucket and upload files**  

1. Copy all files in genconf/serve to OSS bucket (see sample script)

**Creating DC/OS cluster**  

1. Go to ROS section
2. Click on __New Resource Stack__
3. Copy and Paste ROS template into dialogue box and click __Next__
4. Enter in __Stack Name__, customize options, then click __Create__

**Notes**
- The region you are deploying into must support the instance types specified
- ROS template has been tested in China (Beijing)
- ROS template using an OS image with DC/OS prereqs preinstalled: https://marketplace.alibabacloud.com/products/56730001/DC_OS_Centos_7_3_powered_by_Mesosphere-cmjj020082.html?spm=5176.2020520133.101.2.49081a461725c4

