module EREDE
  class Iata
    attr_accessor :code,
                  :departure_tax,
                  :flight

    def to_json(*)
      {
        code: @code,
        departureTax: @departure_tax,
        flight: @flight
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def add_flight(flight)
      if @flight == nil
        flight = []
      end

      @flight.push(flight)

      self
    end
  end
end