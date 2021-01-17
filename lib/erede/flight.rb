module EREDE
  class Flight
    attr_accessor :date,
                  :from,
                  :number,
                  :passenger,
                  :to

    def to_json(*)
      {
        date: @date,
        from: @from,
        number: @number,
        passenger: @passenger,
        to: @to
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize(number, from, to, date)
      @number = number
      @from = from
      @to = to
      @date = date
      @passenger = []
    end

    def add_passender(passenger)
      if @passenger == nil
        @passenger = []
      end

      @passenger.push(passenger)

      self
    end
  end
end