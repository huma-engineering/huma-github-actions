#!/usr/bin/env bash
aws configure set default.s3.max_concurrent_requests 50
mkdir ${DIR}
for path in $(gsutil ls gs://${gcs_bucket})
do
    echo "downloading each item from GCS bucket path=${path} to the folder=${DIR}"

    for i in $(seq 1 3)
    do
        [ $i -gt 1 ] && echo "Recovered from an error, attempt #$i" && sleep 15
        gsutil -m -q cp -r -U -c -L cp.log ${path} ${DIR} \
            && s=0 && break || s=$?
    done
    [ $s -gt 0 ] && echo "gsutil failed to copy GCS path=${path}" && (exit $s)

    echo "uploading each item from the folder=${DIR} to the S3 bucket s3://${s3_bucket}"
    aws s3 cp --recursive --only-show-errors ${DIR} s3://${s3_bucket}
    echo "clean up all files from the folder=${DIR} to preserve disk space"
    rm -rf ${DIR}/*
done
echo "Post Configure AWS Credentials clean up"
rm ~/.aws/credentials
