defmodule Reader do
  def start_reading() do #1
    receive do
      {:msg, contents} ->
        IO.puts("Atual recebeu: " <> contents)
    end

    start_reading() #2
  end
end

pid = spawn(fn ->
  Reader.start_reading()
end)

send(pid, {:msg, "mensagem 1"})
send(pid, {:msg, "mensagem 2"})
send(pid, {:msg, "mensagem 3"})

IO.puts("Fim") #3