module EREDE
  class Passenger
    attr_accessor :email,
                  :name,
                  :phone,
                  :ticket

    def to_json(*)
      {
          email: @email,
          name: @name,
          phone: @phone,
          ticket: @ticket
      }.delete_if {|k, v| v.nil?}.to_json
    end

    def initialize(name, email, ticket)
      @name = name
      @email = email
      @ticket = ticket
    end

    def set_phone(ddd, number, type = Phone::CELLPHONE)
      @phone = Phone.new(ddd, number, type)

      self
    end
  end
end