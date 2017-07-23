main_pid = self()

child_pid = spawn(fn ->
  send(main_pid, {:msg, "hello world"})

  receive do
    {:msg, contents} ->
      IO.puts("Filho recebeu: " <> contents)
  end
end)

IO.inspect({"child alive?", Process.alive?(child_pid)}) #1

receive do
  {:msg, contents} ->
    IO.puts("Pai recebeu: " <> contents)
    send(child_pid, {:msg, "hello kid"})
end

:timer.sleep(100) #2

IO.inspect({"child alive?", Process.alive?(child_pid)}) #3