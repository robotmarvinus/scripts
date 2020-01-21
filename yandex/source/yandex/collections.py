import math
import requests
import json

from yandex.token import *

def get_collections_count(token):
    if token != "Error":
        url     = "https://api.collections.yandex.net/v1/boards/?page_size=1"
        headers = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Accept': 'application/json'
        }
        return requests.get(url, headers=headers).json()['count']
    else:
        return "Error"

def get_collections(token):
    if token != "Error":
        count    = get_collections_count()
        url      = "https://api.collections.yandex.net/v1/boards/?page_size=" + str(count)
        headers  = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Accept': 'application/json'
        }
        return requests.get(url, headers=headers).json()['results']
    else:
        return "Error"  

def create_collection(token, title, description, is_private):
    if token != "Error":
        url      = "https://api.collections.yandex.net/v1/boards/"
        headers  = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Content-Type': 'application/json; charset=utf-8'
        }
        body     = {
            'description': description,
            'is_private': is_private,
            'title': title
        }
        jsonBody = json.dumps(body, ensure_ascii=False).encode('utf8')
        return requests.post(url, jsonBody, headers=headers)

    else:
        return "Error"

def print_collections(token):
    collections = get_collections(token)

    print("Коллекций:", len(collections))

    for collection in collections:
        print (collection['title'], collection['id'])




