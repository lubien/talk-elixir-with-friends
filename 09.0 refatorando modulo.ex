defmodule Reader do
  def start_reading() do
    receive do
      {:msg, contents} ->
        IO.puts("Atual recebeu: " <> contents)
    end

    start_reading()
  end
end

pid = spawn_link(fn -> #1
  Reader.start_reading()
end)

send(pid, {:msg, "mensagem 1"})
send(pid, {:msg, "mensagem 2"})
send(pid, {:msg, "mensagem 3"})