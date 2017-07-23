current_process = self()

spawn(fn ->
  #1
  send(current_process, {:msg, "hello world"})
  send(current_process, {:msg, "hello again"})
end)

receive do
  {:msg, contents} ->
    IO.puts("Atual recebeu: " <> contents)
end