module Validation
  def checks_input(str)
    var = gets.chomp
    until yield(var)
      puts 'Please enter a valid option'
      print 'Input value here: '
      var = gets.chomp
    end
    var
  end

  def checks_input
    var = gets.chomp
    until yield(var)
      puts 'Please enter a valid option'
      print 'Input value here: '
      var = gets.chomp
    end
    var
  end
  
end