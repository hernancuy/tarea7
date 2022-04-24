from PIL import Image
import sys


def main():
    path = sys.argv[1]
    image = Image.open(path)
    width, height = image.size
    new_height = int(100 * height / width)
    image = image.resize((100, new_height))
    #"D:/Users/HernanDavid/Descargas/descargar.jpg"
    image = image.convert("L")
    pixels = list(image.getdata())
    #print(image.size)
    string = [pixels[i * width:(i + 1) * width] for i in range(height)]
    output = str(string)
    with open("./image.txt", 'w', encoding='utf-8', newline='') as   f:
        f.write(output)


if __name__=="__main__":
    main()
