import json
import os

import boto3
from notes import decimalencoder

dynamodb = boto3.resource('dynamodb')

def get(event, context):
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

    # fetch todo from the database
    result = table.get_item(
        Key={
            'id': event.requestContext.identity.cognitoIdentityId
        }
    )

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(result['Item'],
            cls=decimalencoder.DecimalEncoder)
    }

    return response
