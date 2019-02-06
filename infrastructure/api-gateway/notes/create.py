import json
import logging
import os
import time
import uuid

import boto3
from notes import library

log = logging.getLogger()
log.setLevel(logging.INFO)
dynamodb = boto3.resource('dynamodb')

def create(event, context):
    log.info('Event Received: {}'.format(event))

    data = json.loads(event['body'])
    if 'text' not in data:
        logging.error("Validation Failed")
        raise Exception("Couldn't create the note.")
        return library.create_response(500, None)

    timestamp = int(time.time() * 1000)

    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

    if 'authorizer' in event['requestContext'] != None:
        userId = event['requestContext']['authorizer']['claims']['cognito:username']
    else:
        userId = 'Anonymous'

    item = {
        'userId': userId,
        'noteId': str(uuid.uuid1()),
        'text': data['text'],
        'createdAt': timestamp,
        'updatedAt': timestamp,
    }

    # write the todo to the database
    table.put_item(Item=item)

    # create a response
    return library.create_response(200, item)
