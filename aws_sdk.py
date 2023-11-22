import boto3

session = boto3.Session(
    aws_access_key_id='access_key',
    aws_secret_access_key='secret_key',
    region_name='eu-central-1'
)

s3_client = session.client('s3')


url = boto3.client('s3').generate_presigned_url(
    ClientMethod='get_object', 
    Params={'Bucket': 'my-tf-test-bucket123', 'Key': 'France night.mp4'},
    ExpiresIn=3600)

print('The URL is - ' + url)

#lambda handler
def lambda_handler(event, context):
    s3_client = boto3.client('s3')
    presigned_url = s3_client.generate_presigned_url(
        'get_object',
        Params={'Bucket': 'my-tf-test-bucket123', 'Key': 'France night.mp4'},
        ExpiresIn=3600  # Expiration time in seconds
    )

    return {
        'statusCode': 200,
        'body': presigned_url
    }