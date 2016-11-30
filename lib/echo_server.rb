class EchoServer
  def run!
    puts "I'm echo server!"
    puts "Type anything or exit to finish"
    until STDIN.eof?
      line = STDIN.readline.chomp
      break if line == "exit"
      puts line
    end
    puts "Goodbye!"
  end
end
