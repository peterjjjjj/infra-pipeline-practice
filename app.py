#!/usr/bin/env python3
from flask import Flask, render_template, jsonify, request
import boto3
from botocore.exceptions import ClientError

app = Flask(__name__)

s3_client = boto3.client('s3', region_name='us-west-1')

BUCKET_NAME = 'peter-app-uploads-bucket-7689'

@app.route('/')
def index():  # put application's code here
    return render_template('index.html')


@app.route('/api/upload', methods=['POST'])
def upload_file():
    # 1. Verify the frontend sent a file under the name 'profilePic'
    if 'profilePic' not in request.files:
        return jsonify({"error": "No file part in the request"}), 400

    file = request.files['profilePic']

    # 2. Verify the user actually selected a file before clicking submit
    if file.filename == '':
        return jsonify({"error": "No file selected for uploading"}), 400

    # 3. Stream the file directly to S3
    if file:
        try:
            s3_client.upload_fileobj(
                file,
                BUCKET_NAME,
                file.filename
            )
            return jsonify({"message": f"Successfully uploaded {file.filename} to S3!"}), 200
        except ClientError as e:
            # Catch and return any AWS permission or network errors
            return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
