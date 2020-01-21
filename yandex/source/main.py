from yandex.token import *
from yandex.cards import *
from yandex.collections import *
from yandex.disk import *

import json

def get_urls():
    listurls = None

    try:
        fileopen = open("./data/list.txt")
        listurls = fileopen.read().split('\n')
        fileopen.close()
    except:
        return "Error"

    return listurls

#https://oauth.yandex.ru
token = get_token()

cards = get_cards(token)
for card in cards:
    print(card)
    break

#path  = "./data/cards.json"
#with open(path, "r") as read_file:
#    cards = json.load(read_file)['cards']

#remove_cards(token)

#collections = get_collections(token)
#for collection in collections:
#    print(collection)

#create_collection(token, "Wallpapers", "walls", False)
#create_card(token, "5de522dbaef10200917ee9ba", "https://c.radikal.ru/c20/1912/90/cc056d0045cf.jpg")
#create_cards("5dec903f40a3232028e0e4bd", get_urls())

#description = "...Destiny Moody Barely Legal [1]\nModel: Destiny Moody\n#teen, #white, #skinny-body, #room, #panties, #naked, #solo, #normal-tits"
#result = update_card(token, "5e230223c68a97008a961abe", "5df9d8a840a3238279b61bf1", description)
#print(result)
#print(result['is_private'])

#result = get_disk_info(token)
#result = get_disk_data(token)
#for item in result['items']:
#    print(item)




