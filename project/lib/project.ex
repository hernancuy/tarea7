defmodule Project do

  def init(path) do
    {_valor, _status} = System.cmd("cmd.exe",["/c","python","lib/image.py",path])
    {:ok, data} = File.read("image.txt")
    {:ok, file} = File.open("asciiart.txt", [:write])
    #Project.init("D:/Users/HernanDavid/Descargas/5449.jpg")
    image = data
    |> treatment()
    |> transform()
    File.write("asciiart.txt", image)
    File.close(file)
  end

  def treatment(data) do
    data
    |> String.replace("0", "0")
    |> String.replace("255", "1")
    |> String.replace("[", "")
    |> String.replace("]]", "")
    |> String.split("], ")
    |> Enum.map(fn x -> String.split(x, ", ") end)
    |> List.flatten()
  end

  def transform(data) do
    data
    |> List.to_string()
    |> Stream.unfold(&String.split_at(&1, 100))
    |> Enum.take_while(&(&1 != ""))
    |> Enum.join("\n")
  end

  #suma todos los elementos y comprueba si es primo
  def sum(number) do
    number
    |> Enum.map(fn x -> String.to_integer(x) end)
    |> Enum.reduce(fn x, acc ->  x + acc end)
    |> verificator()
  end

  #convierte el numero en la imagen a un entero y comprueba si es primo
  def numbertotal(data) do
    data
    |> List.to_string()
    |> String.to_integer()
    |> verificator()
  end

  #transforma toda la información en formato legible, el 100 es el tamaño del re escalado que entra al inicio cuando se hace el tema en python. Modificar al final
  def transform(data) do
    data
    |> List.to_string()
    |> Stream.unfold(&String.split_at(&1, 100))
    |> Enum.take_while(&(&1 != ""))
    |> Enum.join("\n")
  end

  def verificator(number) do
    cond  do
      miller_rabin?(number, 1000) == true ->
        IO.puts(number)
      miller_rabin?(number, 1000) == false ->
        number= number+1
        verificator(number)
    end
  end

  #
  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end

  def start( _type, _args ) do
    primes = 5..1000
      |> Enum.filter( fn( x ) -> (rem x, 2) == 1 end )
      |> Enum.filter( fn( x ) -> miller_rabin?( x, 10) == true end )
    IO.inspect( primes, label: "Primes: ", limit: :infinity )

    { :ok, self() }
  end

  def modular_exp( x, y, mod ) do
     with [ _ | bits ] = Integer.digits( y, 2 ) do
          Enum.reduce bits, x, fn( bit, acc ) -> acc * acc |> ( &( if bit == 1, do: &1 * x, else: &1 ) ).() |> rem( mod ) end
     end
  end

  def miller_rabin( d, s ) when rem( d, 2 ) == 0, do: { s, d }
  def miller_rabin( d, s ), do: miller_rabin( div( d, 2 ), s + 1 )

  def miller_rabin?( n, g ) do
       { s, d } = miller_rabin( n - 1, 0 )
       miller_rabin( n, g, s, d )
  end

  def miller_rabin( n, 0, _, _ ), do: true
  def miller_rabin( n, g, s, d ) do
    a = 1 + Rand.uniform( n - 3 )
    x = modular_exp( a, d, n )
    if x == 1 or x == n - 1 do
      miller_rabin( n, g - 1, s, d )
    else
      if miller_rabin( n, x, s - 1) == True, do: miller_rabin( n, g - 1, s, d ), else: false
    end
  end

  def miller_rabin( n, x, r ) when r <= 0, do: false
  def miller_rabin( n, x, r ) do
    x = modular_exp( x, 2, n )
    unless x == 1 do
      unless x == n - 1, do: miller_rabin( n, x, r - 1 ), else: True
    else
      false
    end
  end
end
