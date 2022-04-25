defmodule Project do

  #@ascii_list "0896453271"

  def prueba(path) do
    {valor, status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, file} = File.open("asciiart.txt", [:write])
    {:ok, data} = File.read("image.txt")
    #String.split(data, ~r/.{3}/, include_captures: true, trim: true)
    data
    #|> String.split("]", trim: true)
    #pixels = :binary.bin_to_list data
    #pixels
    #|> Enum.take_every(3)
    #|> List.flatten()
    #string = Kernel.to_string(pixels)
    #string
    #|> String.split("]")
    |> String.replace("[", "")
    |> String.replace("]]", "")
    |> String.split("], ")
    |> Enum.map(fn x -> String.split(x, ", ") end)
    |> Enum.map(fn val -> Enum.map(val, fn val2 -> String.to_integer(val2) end ) end)
    |> Enum.map(fn val -> Enum.map(val, fn val2 -> dataconvert(val2) end ) end)
    |> Enum.map(fn val -> Enum.map(val, fn val2 -> Integer.to_string(val2) end ) end)


  end

  def dataconvert(data) when data >= 226, do: data = 0
  def dataconvert(data) when data <= 25, do: data = 1
  def dataconvert(data) when data >= 51 or data <= 75, do: data = 2
  def dataconvert(data) when data >= 176 or data <= 200, do: data = 3
  def dataconvert(data) when data >= 101 or data <= 125, do: data = 4
  def dataconvert(data) when data >= 76 or data <= 100, do: data = 5
  def dataconvert(data) when data >= 126 or data <= 150, do: data = 6
  def dataconvert(data) when data >= 26 or data <= 50, do: data = 7
  def dataconvert(data) when data >= 208 or data <= 225, do: data = 8
  def dataconvert(data) when data >= 156 or data <= 175, do: data = 9

end
