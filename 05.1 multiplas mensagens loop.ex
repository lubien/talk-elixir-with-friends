pid = spawn(fn ->
  for _ <- 1..2 do
    receive do
      {:msg, contents} ->
        IO.puts("Atual recebeu: " <> contents)
    end
  end
end)

send(pid, {:msg, "hello world"})
send(pid, {:msg, "hello again"})
send(pid, {:msg, "more hellos"})

