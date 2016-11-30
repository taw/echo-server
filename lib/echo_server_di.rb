class EchoServerDI
  def initialize(input=STDIN, output=STDOUT)
    @input = input
    @output = output
  end

  def run!
    greeting_sayer.run!
    until @input.eof?
      line = @input.readline.chomp
      break if line == "exit"
      @output.puts line
    end
    goodbye_sayer.run!
  end

  def greeting_sayer
    GreetingsSayer.new(@output)
  end

  def goodbye_sayer
    GoodbyeSayer.new(@output)
  end
end

class GreetingsSayer
  def initialize(output=STDOUT)
    @output = output
  end

  def run!
    @output.puts "I'm echo server!"
    @output.puts "Type anything or exit to finish"
  end
end

class GoodbyeSayer
  def initialize(output=STDOUT)
    @output = output
  end

  def run!
    @output.puts "Goodbye!"
  end
end
