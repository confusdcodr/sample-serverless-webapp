import json
import logging
import os

import boto3
from notes import library

#log = logging.getLogger()
#log.setLevel(logging.INFO)
dynamodb = boto3.resource('dynamodb')

def list(event, context):
    response = {}
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

    # fetch all notes from the database
    try:
        response = table.scan()
    except ClientError as e:
        #log.error(e.response['Error'])
        response['error'] = 'Failed to retrieve notes'
    else:
        if 'Items' not in response.keys():
            response['Items'] = []

    return library.create_response(200, response['Items'])
