import os
import requests

from bs4 import BeautifulSoup

def get_html(url):
    try:
        response = requests.get(url)
    except requests.Timeout:
        message = "GET_HTML: Ошибка timeout, url: " + url
        print(message)
        return "Error"
    except requests.HTTPError as error:
        message = "GET_HTML: Ошибка url  (0), код: (1)".format(url, code)
        print(message)
        return "Error"
    except requests.RequestException:
        message = "GET_HTML: Ошибка скачивания " + url
        application.window.content.console.print_text(message)
        return "Error"
    else:
        return response.text

def get_parser(url):
    html = get_html(url)
    if html != "Error":
        parser = BeautifulSoup(html, 'html.parser')
        return parser
    else:
        return None

parser = get_parser("https://www.theomegaproject.org/galleries?from=2290")
if parser:
    data = parser.find("div", "content").find_all("div", "white_picture")
    for item in data:
        preview = "https://" + item.find("img").attrs['src'][2:]
        print(preview)
