defmodule Reader do
  def start_link() do #1
    spawn_link(fn -> #2 (pid?)
      start_reading()
    end)
  end

  defp start_reading() do #3 (defp)
    receive do
      {:msg, contents} ->
        IO.puts("Atual recebeu: " <> contents)
    end

    start_reading()
  end
end

pid = Reader.start_link() #4

send(pid, {:msg, "mensagem 1"})
send(pid, {:msg, "mensagem 2"})
send(pid, {:msg, "mensagem 3"})