#!/bin/sh
export AWS_DEFAULT_OUTPUT="json"
if [ $# -eq 0 ]
then
    echo "USAGE : ./upload.sh folderpath "
    exit 1
fi
aws s3 sync $1 s3://$TF_VAR_bucket_name
