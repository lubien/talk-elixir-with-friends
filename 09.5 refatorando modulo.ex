defmodule Reader do
  use GenServer

  def start_link() do
    GenServer.start_link(Reader, :ok, name: Reader) #1
  end

  def read(msg) do
    GenServer.cast(Reader, {:msg, msg}) #2
  end

  def handle_cast({:msg, contents}, _) do
    IO.puts("Leitor recebeu: " <> contents)
    {:noreply, :ok}
  end
end

Reader.start_link()

# 2
Reader.read("mensagem 1")
Reader.read("mensagem 2")
Reader.read("mensagem 3")
