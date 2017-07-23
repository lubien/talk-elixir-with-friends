pid = spawn(fn ->
  1 / 0
end)

IO.inspect({"alive?", Process.alive?(pid)})
