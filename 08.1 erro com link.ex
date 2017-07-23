pid = spawn_link(fn -> #1
  1 / 0
end)

IO.inspect({"alive?", Process.alive?(pid)})
