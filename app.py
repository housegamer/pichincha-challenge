from flask import Flask, request, abort
import jwt
import random
import string
import os

app = Flask(__name__)

port = 8080
API_KEY = '2f5ae96c-b558-4c7b-a590-a501ae1c3f6c'

    
@app.route('/DevOps', methods=['POST'])
def main():
    payload = request.get_json()
    message = payload['message']
    recipient = payload['to']
    sender = payload['from']
    time_to_live = payload['timeToLifeSec']
    
    generate_random_token = ''.join(random.choices(string.ascii_letters + string.digits, k=16))
    encode_jwt_token = jwt.encode(payload, f'{API_KEY}' + generate_random_token, algorithm="HS256")

    api_key = request.headers.get('X-Parse-REST-API-Key')
    
    if not api_key or api_key != API_KEY:
        abort(404, 'Invalid API key')
    
    print(f'Message: {message}\nRecipient: {recipient}\nSender: {sender}\ntimeToLifeSec: {time_to_live}')
    return f'Hello {recipient}, to see your message please use this token {encode_jwt_token}'


@app.route('/DevOps', methods=['GET', 'PUT', 'DELETE'])
def unsupported_methods():
    abort(401, "Unsupported Method")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=port, debug=True)