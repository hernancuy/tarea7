from PIL import Image
import sys


def main():
    path = sys.argv[1]
    image = Image.open(path)
    width, height = image.size
    new_width = 100
    height = int(new_width * height / width)
    width = new_width
    image = image.resize((width, height))
    image = image.convert("1")
    pixels = list(image.getdata())
    #print(image.size)
    string = [pixels[i * width:(i + 1) * width] for i in range(height)]
    output = str(string)
    with open("./image.txt", 'w', encoding='utf-8', newline='') as   f:
        f.write(output)


if __name__=="__main__":
    main()
