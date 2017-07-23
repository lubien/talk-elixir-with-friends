IO.inspect({"pid externo", self()}) #1

pid = spawn(fn ->
  IO.inspect({"pid interno", self()}) #2

  receive do
    {:msg, contents} ->
      IO.puts(contents)
  end
end)

IO.inspect({"pid recebido", pid}) #3

send(pid, {:msg, "hello world"})