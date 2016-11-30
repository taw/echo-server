describe EchoServer do
  it "echos what you wrote" do
    server = EchoServer.new
    server.run!
  end
end
