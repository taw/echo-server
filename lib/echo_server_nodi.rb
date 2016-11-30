class EchoServerNODI
  def run!
    greeting_sayer.run!
    until STDIN.eof?
      line = readline.chomp
      break if line == "exit"
      puts line
    end
    goodbye_sayer.run!
  end

  def greeting_sayer
    GreetingsSayerNODI.new
  end

  def goodbye_sayer
    GoodbyeSayerNODI.new
  end
end

class GreetingsSayerNODI
  def run!
    puts "I'm echo server!"
    puts "Type anything or exit to finish"
  end
end

class GoodbyeSayerNODI
  def run!
    puts "Goodbye!"
  end
end
