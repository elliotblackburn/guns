module Guns

  class Application
    def initialize
      super
      @name = 'twitter-guns'
    end

    def run(app_name='twitter-guns')
      @name = app_name
    end
  end
end
