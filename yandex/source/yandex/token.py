def get_token():
    token = None

    try:
        fileopen = open("./data/token.txt")
        token    = fileopen.readline().strip()
        fileopen.close()
    except:
        token = "Error"

    if token == None or len(token) == 0:
        token = "Error"

        print("Ошибка: файл token.txt")

    return token
        

