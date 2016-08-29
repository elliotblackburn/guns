require 'httparty'
require 'nokogiri'
require 'yaml'
require 'pry'

module Guns
  class Scraper
    URL = "http://www.gunviolencearchive.org/last-72-hours"

    def initialize(reporter, incident_store)
      @reporter = reporter
      @incident_store = incident_store
    end

    def run
      page = HTTParty.get(URL)
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
        # It's new so post it to twitter
        @reporter.report_incident incidents[0]
      end
    end

  private
    def parse_incident(table_entry)
      date = table_entry.children[1].children.text
      state = table_entry.children[2].children.text
      city = table_entry.children[3].children.text
      address = table_entry.children[4].children.text
      num_killed = table_entry.children[5].children.text
      num_injured = table_entry.children[6].children.text

      if table_entry.children[7].children[0].children[2] != nil
        source = table_entry.children[7].children[0].children[2].children[0].attributes["href"].value
      else # No source :(
        source = ""
      end

      return Incident.new(date, state, city, address, num_killed, num_injured, source)
    end
  end
end
