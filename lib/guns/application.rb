require 'httparty'
require 'nokogiri'
require 'yaml'

module Guns
  class Application
    def initialize
      super
      @name = 'twitter-guns'
      @incident_store = IncidentStore.new
    end

    def run(app_name='twitter-guns')
      @name = app_name
      scrape
    end

    def scrape
      page = HTTParty.get('http://www.gunviolencearchive.org/last-72-hours')
      parse_page = Nokogiri::HTML(page)

      raw_table = parse_page.css('#block-system-main').css('.sticky-enabled')
      table_entries = raw_table.xpath('//tbody')[0].children

      incidents = Array.new
      table_entries.each do |entry|
        if entry.is_a? Nokogiri::XML::Element
          incident = parse_incident entry
          incidents.push incident
        end
      end

      if @incident_store.incident_is_newest? incidents[0]
        # Post to twitter
        puts "Reporting incident"
      else
        # Do nothing
        puts "Nothing new to report"
      end
    end

  private
    def parse_incident(table_entry)
      date = table_entry.children[0].children.text
      state = table_entry.children[1].children.text
      city = table_entry.children[2].children.text
      address = table_entry.children[3].children.text
      num_killed = table_entry.children[4].children.text
      num_injured = table_entry.children[5].children.text

      return Incident.new(date, state, city, address, num_killed, num_injured)
    end
  end
end
