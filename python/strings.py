import re

def print_string():
    http  = "http://"
    image = "image.jpg"
    url   = "http://image.jpg"

    if url[:7] == http:
        print(http)

def print_first_element():
    string = ""
    print("len:", len(string))
    if len(string) > 0:
        print(string[0])
    else:
        print("Not found...")

def print_string_array():
    string = "sss ddd fff eee"
    for item in string.split(" "):
        print(item)

def print_string_none():
    string = None
    print("строка" + string + " ?")

def print_len_string_none():
    string = None
    if string:
        print(len(string))
    else:
        print("Строка не существует")

def find_string():
    string_one = "sdf_-orig2rew"
    string_two = "sdf_-rew"
    if string_two.find("orig") == -1:
        print(f"Подстрока orig в строке {string_two} не найдена")

def find_regex():
    result = re.search(r'Analytics', 'AV Analytics Vidhya AV')
    print(result)

print_len_string_none()
