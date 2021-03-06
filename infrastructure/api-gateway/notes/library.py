import decimal
import json

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(json.JSONEncoder):
  def default(self, o):
    if isinstance(o, decimal.Decimal):
      if o % 1 > 0:
        return float(o)
      else:
        return int(o)
    return super(DecimalEncoder, self).default(o)

def xss_encode(field):
  return field

def create_response(status, body):
  # create a response
  response = {
    'statusCode': status,
    'headers': {
      #'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Origin': 'http://gowens-serverless.s3-website-us-east-1.amazonaws.com',
      'Access-Control-Allow-Credentials' : 'true'
    },
    'body': json.dumps(body, cls=DecimalEncoder)
  }

  return response
