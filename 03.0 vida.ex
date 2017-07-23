pid = spawn(fn ->
  receive do
    {:msg, contents} ->
      IO.puts(contents)
  end
end)

IO.puts(Process.alive?(pid)) #1

send(pid, {:msg, "hello world"})

:timer.sleep(100) #2

IO.puts(Process.alive?(pid)) #3