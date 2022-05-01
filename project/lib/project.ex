defmodule Project do

  def init(path) do
    {_valor, _status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, data} = File.read("image.txt")
    {:ok, file} = File.open("asciiart.txt", [:write])
    #Project.init("D:/Users/HernanDavid/Descargas/prueba.png")
    image = data
    |> String.replace("255", "1")
    |> String.replace("0", "8")
    |> String.replace("    ", "")
    |> String.replace("[", "")
    |> String.replace("]]", "")
    |> String.replace("],", "\n")
    |> String.replace(" ", "")
    |> String.replace(",", "")
    |> String.split("\n, ")
    File.write("asciiart.txt", image)
    File.close(file)

    len = image
    |> length()

    last = image
    |> Enum.at(len-1)
  end

end
