#!/bin/bash

# these variables can only be used after only 2 ec2 instances have been launched
# also can only be used to start, stop or terminate. Use terraform to launch

a=$(aws ec2 describe-instances | grep InstanceId | cut -c 36-54 | sed "2d")
b=$(aws ec2 describe-instances | grep InstanceId | cut -c 36-54 | sed "1d")
instance="$a $b"
for x in $instance
do
echo "$1ing instance"
aws ec2 $1-instances --instance-ids $x
done
echo "Your request has been completed"