import requests

from vk.api import *

def vk_get_user_info(token, user_id):
    url    = vk_api_url + "users.get"
    params = {
        'user_id': user_id,
        'access_token': token,
        'v': vk_api_version
    }
    return requests.get(url, params=params).json()['response'][0]
