defmodule Reader do
  def start_link() do
    pid = spawn_link(fn ->
      loop()
    end)

    Process.register(pid, Reader) #1
  end

  defp loop() do
    receive do
      {:msg, contents} ->
        IO.puts("Leitor recebeu: " <> contents)
    end

    loop()
  end
end

Reader.start_link()

#2
send(Reader, {:msg, "mensagem 1"})
send(Reader, {:msg, "mensagem 2"})
send(Reader, {:msg, "mensagem 3"})
