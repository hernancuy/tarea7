defmodule Project do

  #@ascii_list "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~i!lI;:,\"^`"
  

  def init(path) do
    {_valor, _status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, data} = File.read("image.txt")
    IO.puts("Output")
    #IO.inspect(data)
    #String.split(data, ~r/.{3}/, include_captures: true, trim: true)
    #pixels = :binary.bin_to_list(data)
    #IO.inspect(pixels)
    #image = data |> Kernel.to_string(pixels)

    #Project.init("C:/Users/ArturoHurtado/Downloads/descargar.png")
    image = data
    |> String.replace("[", "")
    |> String.replace("]]", "")
    |> String.split("], ")
    |> Enum.map(fn x -> String.split(x, ", ") end)

    len = image
    |> length()
    |> IO.inspect()

    last = image
    |> IO.inspect()
    |> Enum.at(len-1)
  end

end
