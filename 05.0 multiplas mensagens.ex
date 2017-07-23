pid = spawn(fn ->
  receive do
    {:msg, contents} ->
      IO.puts("Recebeu: " <> contents)
  end

  IO.puts("Depois") #1
end)

#1
send(pid, {:msg, "hello world"})
send(pid, {:msg, "hello again"})

