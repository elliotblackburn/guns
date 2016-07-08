require 'optparse'
require 'rufus-scheduler'
require 'raygun4ruby'

module Guns
  class Application
    def initialize
      super
      @name = 'twitter-guns'
      @opts = parse_options
      reporter = TwitterReporter.new(@opts[:key], @opts[:secret], @opts[:token], @opts[:token_secret])
      incident_store = IncidentStore.new
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
        opts.on('-r', '--raygun KEY', 'Key') { |v| options[:raygun_key] = v }
      end.parse!

      return options
    end

    def run(app_name='twitter-guns')
      @name = app_name

      # Configure raygun
      Raygun.setup do |config|
        config.api_key = @opts[:raygun_key]
      end

      # Track all unhandled exceptions with Raygun
      begin
        interval = "1m"
        puts "Scraping every #{interval}"
        @scheduler.every interval do
          puts "scraping"
          @scraper.run
        end

        @scheduler.join
      rescue Exception => e
        Raygun.track_exception e
      end

    end
  end
end
