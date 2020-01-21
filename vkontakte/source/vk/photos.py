import requests

from vk.api import *

def vk_get_photo_albums(token, user_id):
    url    = vk_api_url + "photos.getAlbums"
    params = {
        'user_id': user_id,
        'access_token': token,
        'v': vk_api_version
    }
    return requests.get(url, params=params).json()['response']['items']

def vk_find_photo_album_id(title, albums):
    for album in albums:
        if title == album['title']:
            return album['id']
    return None

def vk_find_photo_album(title, albums):
    for album in albums:
        if title == album['title']:
            return True
    return False

def vk_create_photo_album(token, user_id, title):
    url  = vk_api_url + "photos.createAlbum"
    params = {
        'user_id': user_id,
        'title': title,
        'access_token': token,
        'v': vk_api_version
    }
    return requests.get(url, params=params).json()['response']

def vk_get_upload_server(token, album_id):
    url  = vk_api_url + "photos.getUploadServer"
    params = {
        'album_id': album_id,
        'access_token': token,
        'v': vk_api_version
    }
    return requests.get(url, params=params).json()['response']['upload_url']

def vk_upload_photo(token, user_id, album_id, path):
    upload_url  = vk_get_upload_server(token, album_id)
    upload_file = {'file1': open(path, 'rb')}
    response    = requests.post(upload_url, files=upload_file).json()
    save_url    = vk_api_url + "photos.save"
    params      = {
        'album_id': response['aid'],
        'server': response['server'],
        'photos_list': response['photos_list'],
        'hash': response['hash'],
        'access_token': token,
        'v': vk_api_version
    }
    return requests.get(save_url, params=params).json()['response']
