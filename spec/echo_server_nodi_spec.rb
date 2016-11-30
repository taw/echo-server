require "stringio"

describe EchoServerNODI do
  it "echos what you wrote" do
    server = EchoServerNODI.new
    allow(server).to receive(:readline).and_return(
      "one\n",
      "two\n",
      "three\n"
    )
    allow(STDIN).to receive(:eof?).and_return(
      false, false, false, true
    )
    expect(STDOUT).to receive(:puts).with("I'm echo server!")
    expect(STDOUT).to receive(:puts).with("Type anything or exit to finish")
    expect(STDOUT).to receive(:puts).with("one")
    expect(STDOUT).to receive(:puts).with("two")
    expect(STDOUT).to receive(:puts).with("three")
    expect(STDOUT).to receive(:puts).with("Goodbye!")
    server.run!
  end

  it "obeys exit command" do
    server = EchoServerNODI.new
    allow(server).to receive(:readline).and_return(
      "one\n",
      "two\n",
      "exit\n"
    )
    allow(STDIN).to receive(:eof?).and_return(
      false, false, false
    )
    expect(STDOUT).to receive(:puts).with("I'm echo server!")
    expect(STDOUT).to receive(:puts).with("Type anything or exit to finish")
    expect(STDOUT).to receive(:puts).with("one")
    expect(STDOUT).to receive(:puts).with("two")
    expect(STDOUT).to receive(:puts).with("Goodbye!")
    server.run!
  end
end
