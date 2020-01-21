import os

path  = "./data/cards.json"
if os.path.exists(path) == True:
    with open(path, "r") as read_file:
        cards = json.load(read_file)['cards']
