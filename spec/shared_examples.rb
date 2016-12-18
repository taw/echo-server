require "stringio"

shared_examples_for "echo server" do
  it "echoes what you wrote" do
    input = StringIO.new("one\ntwo\nthree\n")
    output = StringIO.new("")
    server = described_class.new(input, output)
    server.run!
    expect(output.string).to eq(
      "I'm echo server!\n"+
      "Type anything or exit to finish\n"+
      "one\n"+
      "two\n"+
      "three\n"+
      "Goodbye!\n"
    )
  end

  it "obeys exit command" do
    input = StringIO.new("one\ntwo\nexit\nfour\n")
    output = StringIO.new("")
    server = described_class.new(input, output)
    server.run!
    expect(output.string).to eq(
      "I'm echo server!\n"+
      "Type anything or exit to finish\n"+
      "one\n"+
      "two\n"+
      "Goodbye!\n"
    )
  end
end
