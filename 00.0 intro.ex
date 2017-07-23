pid = spawn(fn -> #1
  receive do #2
    {:msg, contents} ->
      IO.puts(contents)
  end
end)

IO.inspect({"pid", pid})

send(pid, {:msg, "hello world"}) #3