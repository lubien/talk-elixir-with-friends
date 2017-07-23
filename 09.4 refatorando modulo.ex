defmodule Reader do
  def start_link() do
    pid = spawn_link(fn ->
      loop()
    end)

    Process.register(pid, Reader)
  end

  def read(msg) do #1
    send(Reader, {:msg, msg})
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

# 2
Reader.read("mensagem 1")
Reader.read("mensagem 2")
Reader.read("mensagem 3")
