# AWS bundle

* Prerequisites

You need AWS Access Key Id for that create a new user unde IAM and add the desired policy e.g.  AmazonS3FullAccess


* Actions

```bash
# generate credentials
porter credentials generate

# installl EC2 instance
porter install -c CREDENTIALS

# terminating a instance in AWS needs an id aws ec2 terminate-instances --instance-ids i-5203422c
# uninstall EC2 instance
 porter uninstall --param instanceid=INSTANCE_ID_FROM_INSTALL_ACTION -c CREDENTIALS 

# create S3 bucket
porter invoke --action=bucket_install --param bucket=BUCKET_NAME -c CREDENTIALS

# list buckets
porter invoke --action=bucket_list -c CREDENTIALS
```

* Links
https://github.com/getporter/aws-mixin

