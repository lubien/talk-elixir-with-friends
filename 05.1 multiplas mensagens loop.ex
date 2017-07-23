current_process = self()

spawn(fn ->
  send(current_process, {:msg, "hello world"})
  send(current_process, {:msg, "hello again"})
  send(current_process, {:msg, "more hellos"})
end)

for _ <- 1..2 do
  receive do
    {:msg, contents} ->
      IO.puts("Atual recebeu: " <> contents)
  end
end