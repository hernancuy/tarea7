defmodule Project do

  #@ascii_list "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~i!lI;:,\"^`"
  

  def init(path) do
    {_valor, _status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, data} = File.read("image.txt")

    #Project.init("C:/Users/ArturoHurtado/Downloads/descargar.png")
    image = data
    |> String.replace("[", "")
    |> String.replace("]]", "")
    |> String.split("], ")
    |> Enum.map(fn x -> String.split(x, ", ") end)

    len = image
    |> length()

    last = image
    |> Enum.at(len-1)
  end

end
