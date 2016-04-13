# kpatch
CloudFormation to:

Create S3 Bucket
Create SNS Topic
Create SQS Queue

SQS Policy to allow SNS to send messages to the queue
SNS Policy to allow S3 Events to send messages to the topic
S3 Event to send SNS Message to Topic when an stdout.txt file is written to /ssm 
