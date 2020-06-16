module MyValidations
  def checks_input
    var = gets.chomp
    while !yield(var)
      p yield(var)
      puts "Please enter a valid option"
      var = gets.chomp
    end
    var
  end
end