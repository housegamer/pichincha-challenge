from flask import Flask, request, abort
import jwt

app = Flask(__name__)

API_KEY= '2f5ae96c-b558-4c7b-a590-a501ae1c3f6c'

@app_route('/DevOps', methods=['POST'])
def main():
    encode_token = request.get.data()
    api_key = request.headers.get('X-Parse-REST-API-Key')
    
    if not api_key or api_key != API_KEY:
        abort(401, 'Invalid API key')
        
    try:
        decode_token = jwt.decode(encode_token, 'secret', algorithms=['HS256'])
    except jwt.execptions.InvalidTokenError:
        abort(401, 'Invalid token')

    payload = request.get_json()
    message = payload['message']
    recipient = payload['to']
    sender = payload['from']
    time_to_live = payload['timeToLifeSec']

    print(f'Message: {message}\nRecipient: {recipient}\nSender: {sender}\ntimeToLifeSec: {time_to_live}')
    return 'Message Received'

@app_route('/DevOps', methods=['GET', 'PUT', 'DELETE'])
def unsupported_methods():
    abort(405, "Unsupported method")

if __name__ == 'main':
    app.run(debug=True)