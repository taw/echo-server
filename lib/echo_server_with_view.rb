module EchoServerWithView
  class Server
    def initialize(input=STDIN, output=STDOUT)
      @input = input
      @output = output
      @view = View.new(@output)
    end

    def run!
      @view.say_hello
      until @input.eof?
        line = @input.readline.chomp
        break if line == "exit"
        @view.echo_user_line(line)
      end
      @view.say_goodbye
    end

    def greeting_sayer
      GreetingsSayer.new(@output)
    end

    def goodbye_sayer

    end
  end

  class View
    def initialize(output)
      @output = output
    end

    def say_hello
      @output.puts "I'm echo server!"
      @output.puts "Type anything or exit to finish"
    end

    def say_goodbye
      @output.puts "Goodbye!"
    end

    def echo_user_line(line)
      @output.puts line
    end
  end
end
