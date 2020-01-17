#!/usr/bin/env python
# -*- coding: utf-8 -*-

#sudo apt-get install python3-bs4

import requests
import re

from urllib.parse import urlparse
from bs4 import BeautifulSoup, Tag, NavigableString

def get_html(url):
    try:
        response = requests.get(url)
    except requests.Timeout:
        out = "GET_HTML: Ошибка timeout, url: " + url
        print(out)
        return "Error"
    except requests.HTTPError as error:
        out = "GET_HTML: Ошибка url  (0), код: (1)".format(url, code)
        print(out)
        return "Error"
    except requests.RequestException:
        out = "GET_HTML: Ошибка скачивания " + url
        print(out)
        return "Error"
    else:
        return response.text

def get_parse_data(html):
    parser = BeautifulSoup(html, 'html.parser')
    return parser

def print_wikipedia_string(it, space, text):
    string = text.replace("\n", "").replace("\"", "")
    string = (it * space) + string
    print(string)

def print_wikipedia_list(it, space, ul):
    for li in ul.findAll('li', recursive=False):
        if len(li.findAll('ul')) > 0:
            for item in li.contents:
                if item.name == "ul":
                    print_wikipedia_list(it + 1, space, item)
                else:
                    if isinstance(item, NavigableString):
                        print_wikipedia_string(it, space, item)
                    elif isinstance(item, Tag):
                        print_wikipedia_string(it, space, item.text)
        else:
            print_wikipedia_string(it, space, li.text)

def print_wikipedia_table(it, space, table):
    trlist = table.findAll('tr')

    for tr in trlist:
        tdlist = tr.findAll('td')
        if len(tdlist) > 0:
            td = tdlist[0]
            print_wikipedia_string(it, space, td.text)

def parse_wikipedia_page(url, typedata):
    space = "    "
    it    = 0

    html  = get_html(url)
    if html != "Error":
        data  = get_parse_data(html).find("div", { "class" : "mw-parser-output" })
        array = data.findAll(True, recursive=False)

        for index in array:
            if index.name == "h2":
                print("\n" + index.find("span", { "class" : "mw-headline" }).text)
            elif typedata[0] == "list" and index.name == "ul":
                print_wikipedia_list(it + 1, space, index)
            elif typedata[0] == "table" and index.name == "table":
                print_wikipedia_table(it + 1, space, index)

if __name__ == "__main__":
    #["table"] - парсить таблицу страницы
    #["list"]  - парсить список страницы

    url = "https://ru.wikipedia.org/wiki/список_произведений_Иоганна_Себастьяна_Баха"
    parse_wikipedia_page(url, ["list"])

    #parse_wikipedia_ussr_films()
    #parse_sovkinofilm()
