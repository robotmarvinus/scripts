import requests
import json

from yandex.token import *

def get_disk_info():
    token = get_token()
    if token != "Error":
        url      = "https://cloud-api.yandex.net/v1/disk/"
        headers  = {'Authorization': 'OAuth ' + token}
        return requests.get(url, headers=headers).json()
    else:
        print("Ошибка: файл token.txt")
        return "Error"

def get_disk_data():
    token = get_token()
    if token != "Error":
        #https://cloud-api.yandex.net/v1/disk/resources"
        url      = "https://cloud-api.yandex.net/v1/disk/resources/public"
        headers  = {'Authorization': 'OAuth ' + token}
        return requests.get(url, headers=headers).json()
    else:
        print("Ошибка: файл token.txt")
        return "Error"
