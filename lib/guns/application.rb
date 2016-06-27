require 'optparse'
require 'rufus-scheduler'

module Guns
  class Application
    def initialize
      super
      @name = 'twitter-guns'
      opts = parse_options
      incident_store = IncidentStore.new
      reporter = TwitterReporter.new(opts[:key], opts[:secret], opts[:token], opts[:token_secret])
      @scheduler = Rufus::Scheduler.new
      @scraper = Scraper.new(reporter, incident_store)
    end

    def parse_options
      options = {}
      OptionParser.new do |opts|
        opts.on('-k', '--key KEY', 'Key') { |v| options[:key] = v }
        opts.on('-s', '--secret SECRET', 'Secret') { |v| options[:secret] = v }
        opts.on('-t', '--token TOKEN', 'Token') { |v| options[:token] = v }
        opts.on('-q', '--token_secret TOKEN_SECRET', 'Token secret') { |v| options[:token_secret] = v }
      end.parse!

      return options
    end

    def run(app_name='twitter-guns')
      @name = app_name

      interval = "1m"
      puts "Running every #{interval}!"
      @scheduler.in interval do
        puts "scraping"
        @scraper.run
      end

      @scheduler.join
    end
  end
end
