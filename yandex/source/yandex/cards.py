import requests
import json

from math import ceil

from yandex.token import *

def get_cards_count(token):
    if token != "Error":
        url      = "https://api.collections.yandex.net/v1/cards/?page_size=1"
        headers  = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Accept': 'application/json'
        }
        return requests.get(url, headers=headers).json()['count']
    else:
        return "Error"    

def get_pages_count(cards, cards_page):
    return ceil(cards / cards_page)

def get_cards(token):
    if token != "Error":
        print("Поиск картинок в коллекциях яндекс...")

        cards = []
        count = get_cards_count(token)
        size  = 100
        page  = 0
        pages = get_pages_count(count, size)
        for i in range(pages):
            page    = i + 1
            url     = "https://api.collections.yandex.net/v1/cards/?page=" + str(page) + "&page_size=" + str(size)
            headers = {
                'Host': 'api.collections.yandex.net',
                'Authorization': 'OAuth ' + token,
                'Accept': 'application/json'
            }
            response = requests.get(url, headers=headers)
            result   = response.json()['results']

            for item in result:
                cards.append(item)

            print("Страница: " + str(page) + "/" + str(pages), end="\r")

        print("Страница: " + str(page) + "/" + str(pages))

        return cards
    else:
        return "Error"

def create_card(token, collection_id, image_url, description):
    if token != "Error":
        url     = "https://api.collections.yandex.net/v1/cards/"
        headers = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Content-Type': 'application/json; charset=utf-8'
        }
        body    = {
            'board_id': collection_id,
            'content': [{
                'source': {
                    'url': image_url
                },
                'source_type': 'image'
            }],
            'description': description,
            'source_meta': {
                'page_domain': 'radikal.ru',
                'page_title': '',
                'page_url': image_url
            }
        }

        jsonBody = json.dumps(body, ensure_ascii=False).encode('utf8')

        return requests.post(url, jsonBody, headers=headers)
    else:
        return "Error"

def create_cards(token, collection_id, urls):
    if token != "Error":
        cards = get_cards(token)
        description = "#images"
        for i in range(len(urls) - 1):
            num = i + 1
            url = urls[i]

            if num < 10:
                num = '00' + str(num)
            elif num < 100:
                num = '0' + str(num)
            else:
                num = str(num)

            if not url in cards:
                response = create_card(token, collection_id, url, description)
                print(num + '.Создано:', response, url)
            else:
                print(num + '.Найдено:', url)

def update_card(token, card_id, collection_id, description):
    if token != "Error":

        print("card_id", card_id)
        print("collection_id:", collection_id)
        print("description:\n" + description)

        url     = "https://api.collections.yandex.net/v1/cards/" + card_id +"/"
        headers = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Content-Type': 'application/json; charset=utf-8'
        }
        body    = {
            'board_id': collection_id,
            'description': description,
            'is_private': False
        }
        jsonBody = json.dumps(body, ensure_ascii=False).encode('utf8')
        response = requests.patch(url, jsonBody, headers=headers)

        return response.json()
    else:
        return "Error"

def remove_card(token, card_id):
    if token != "Error":
        url     = "https://api.collections.yandex.net/v1/cards/" + card_id +"/"
        headers = {
            'Host': 'api.collections.yandex.net',
            'Authorization': 'OAuth ' + token,
            'Content-Type': 'application/json; charset=utf-8'
        }
        return requests.delete(url, headers=headers)

def remove_cards(token):
    if token != "Error":
        cards = get_cards(token)
        index = 0
        count = len(cards)

        print("Удаляются файлы...")

        for card in cards:
            if card['is_private'] == True:
                remove_card(token, card['id'])
                index = index + 1

                print("Удалено:" + str(index) + "/" + str(count), end="\r")

        print("Удалено:" + str(index))
        print("Осталось:" + str(count - index))

def print_blocked_images():
    path   = "./data/cards.json"
    cards  = []
    collection = []
    remove = []

    if os.path.exists(path) == True:
        with open(path, "r") as fopen:
            cards = json.load(fopen)['cards']
    else:
        cards = get_cards(token)
        data  = {'cards': cards}
        with open("./data/cards.json", "w", encoding="utf-8") as fopen:
            json.dump(to_json, fopen, ensure_ascii=False, sort_keys=True, indent=4)

    for item in cards:
        if item['board']['title'] == "Galleries":
            collection.append(item)

    for item in collection:
        if item['is_private'] == True:
            remove.append(item)

    print("Всего:", len(data['cards']))
    print("Galleries:", len(cards))
    print("К удалению:", len(collection))
    print("Остается:", len(collection) - len(remove))
