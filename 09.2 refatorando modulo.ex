defmodule Reader do
  def start_link() do
    spawn_link(fn ->
      loop()
    end)
  end

  defp loop() do #1
    receive do
      {:msg, contents} ->
        IO.puts("Atual recebeu: " <> contents)
    end

    loop()
  end
end

pid = Reader.start_link()

send(pid, {:msg, "mensagem 1"})
send(pid, {:msg, "mensagem 2"})
send(pid, {:msg, "mensagem 3"})