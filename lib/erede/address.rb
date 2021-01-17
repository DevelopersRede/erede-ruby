module EREDE
  class Address
    BILLING = 1
    SHIPPING = 2
    BOTH = 3

    APARTMENT = 1
    HOUSE = 2
    COMMERCIAL = 3
    OTHER = 4

    attr_accessor :address,
                  :addressee_name,
                  :city,
                  :complement,
                  :neighbourhood,
                  :number,
                  :state,
                  :type,
                  :zip_code

    def to_json(*)
      {
        address: @address,
        addresseeName: @addressee_name,
        city: @city,
        complement: @complement,
        neighbourhood: @neighbourhood,
        number: @number,
        state: @state,
        type: @type,
        zipCode: @zip_code
      }.delete_if { |k, v| v.nil? }.to_json
    end
  end
end