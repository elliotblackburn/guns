module Guns
  class IncidentStore
    FILE_NAME = 'most_recent_incident.yaml'

    def incident_is_newest?(incident)
      if File.file? FILE_NAME
        File.open(FILE_NAME, 'r') do |file|
          saved_incident = YAML::load file

          if incidents_are_equal?(saved_incident, incident)
            return false
          else
            serialise_incident(FILE_NAME, incident)
            return true
          end
        end
      else
        # Must be the first scrape
        serialise_incident(FILE_NAME, incident)
        return true
      end
    end

    def incidents_are_equal?(incident_one, incident_two)
      # ugly ugly ugly
      if incident_one.date == incident_two.date && incident_one.state == incident_two.state && incident_one.city == incident_two.city && incident_one.address == incident_two.address && incident_one.num_killed == incident_two.num_killed && incident_one.num_injured == incident_two.num_injured && incident_one.source == incident_two.source
        return true
      end
      return false
    end

    def serialise_incident(file_name, incident)
      File.open(FILE_NAME, 'w') do |file|
        file.puts YAML::dump incident
      end
    end
  end
end
