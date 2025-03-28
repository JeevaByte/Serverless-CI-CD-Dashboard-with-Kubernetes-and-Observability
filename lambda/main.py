import json
import time

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': 'System is up!',
            'uptime': int(time.time())
        })
    }
    