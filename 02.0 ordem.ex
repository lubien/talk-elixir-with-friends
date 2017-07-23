IO.puts("1") #1

pid = spawn(fn -> #5 (async)
  IO.puts("2") #2

  receive do # 6 (blocking)
    {:msg, contents} ->
      IO.puts(contents)
  end

  IO.puts("3") #3
end)

send(pid, {:msg, "hello world"})

IO.puts("4") #4
