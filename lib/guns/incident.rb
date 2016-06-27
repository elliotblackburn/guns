module Guns
  class Incident
    attr_reader :date
    attr_reader :state
    attr_reader :city
    attr_reader :address
    attr_reader :num_killed
    attr_reader :num_injured

    def initialize(date, state, city, address, num_killed, num_injured)
      @date = date
      @state = state
      @city = city
      @address = address
      @num_killed = num_killed
      @num_injured = num_injured
    end
  end
end
