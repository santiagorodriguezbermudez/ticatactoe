require_relative 'validations.rb'
class Player
  include MyValidations
  attr_reader :name
  attr_writer :score
  def initialize()
    @name = checks_input {|name| name != ""}
  end
end

