#!/usr/bin/env python
# -*- coding: utf-8 -*-

#sudo apt-get install python3-bs4

import requests
import re
import urllib.parse

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

def parse_wikipedia_category(url, typedata):
    title   = ""
    pages   = []
    childs  = []

    print("Обрабатывается " + url)
    #print(".", sep=' ', end='', flush=True)

    baseurl = "https://" + urlparse(url).netloc
    html    = get_html(url)
    if html != "Error":
        data  = get_parse_data(html)

        title = data.find("h1").text

        if data.find("div", {"id":"mw-subcategories"}):
            for index in data.find("div", {"id":"mw-subcategories"}).findAll("li"):
                if index.find("a"):
                    newurl  = baseurl + index.find("a")['href']
                    newurl  = urllib.parse.unquote(newurl)
                    newtext = index.find("a").text
                    newdata = parse_wikipedia_category(newurl, typedata)
                    childs.append(newdata)

        if data.find("div", {"id":"mw-pages"}):
            for index in data.find("div", {"id":"mw-pages"}).findAll("li"):
                if index.find("a"):
                    newurl  = baseurl + index.find("a")['href']
                    newurl  = urllib.parse.unquote(newurl)
                    newtext = index.find("a").text
                    pages.append([newtext, newurl])

        if data.find("a", text="next page"):
            newurl  = baseurl + data.find("a", text='next page')['href']
            newdata = parse_wikipedia_category(newurl, typedata)
            for i in newdata['pages']:
                pages.append(i)
            for i in newdata['childs']:
                childs.append(i)

    return {'title':title, 'url':url, 'pages':pages, 'childs':childs}

def print_parse_data(data, space, it):
    print ((it * space) + data['title'])

    if len(data['pages']) > 0:
        for i in data['pages']:
            print(((it + 1) * space) + " " + i[0])

    for i in data['childs']:
        print_parse_data(i, space, it + 1)

def filter_list(data, array):
    if len(data['pages']) > 0:
        year_pos = re.search(r'\d\d\d\d', data['title'])
        year     = ""
        if year_pos:
            year = data['title'][year_pos.start():year_pos.end()]

        for i in data['pages']:
            string = i[0] + " | " + i[1]

            if year != "":
                string = year + " | " + string

            if not string in array:
                array.append(string)

    for i in data['childs']:
        filter_list(i, array)

def write_list(array):
    array = sorted(array)

    print("")
    f = open('text.txt', 'w')
    for i in array:
        f.write(i + '\n')
    f.close()

if __name__ == "__main__":
    #["null"] - парсить категорию
    #["page"] - парсить категорию и текст страниц
    #["list"] - парсить категорию и список страниц
    #["tabl"] - парсить категорию и таблицы(в список) страниц

    space = "    "
    it    = 0
    url   = "https://ru.wikipedia.org/wiki/Категория:Фильмы_СССР_по_годам"
    array = []
    data  = parse_wikipedia_category(url, ["null"])

    filter_list(data, array)
    write_list(array)

    #print_parse_data(data, space, it)

