require 'guns/application'

module Guns
  class << self
    def application
      @application ||= Guns::Application.new
    end

    def application=(app)
      @application = app
    end
  end
end
