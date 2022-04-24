defmodule Project do

  @ascii_list "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~i!lI;:,\"^`"

  def prueba(path) do
    {valor, status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, data} = File.read("image.txt")
    #String.split(data, ~r/.{3}/, include_captures: true, trim: true)
    pixels = :binary.bin_to_list data
    pixels
    #|> List.flatten()
    #string = Kernel.to_string(pixels)
    #string
    #|> String.split("]")
  end

end
