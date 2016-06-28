module Guns
  class Incident
    attr_reader :date
    attr_reader :state
    attr_reader :city
    attr_reader :address
    attr_reader :num_killed
    attr_reader :num_injured
    attr_reader :source

    def initialize(date, state, city, address, num_killed, num_injured, source)
      @date = date
      @state = state
      @city = city
      @address = address
      @num_killed = num_killed
      @num_injured = num_injured
      @source = source
    end
  end
end
