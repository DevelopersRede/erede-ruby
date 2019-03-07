module EREDE
  class SubMerchant
    attr_accessor :mcc,
                  :city,
                  :country

    def to_json(*)
      {
          mcc: @mcc,
          city: @city,
          country: @country
      }.delete_if {|k, v| v.nil?}.to_json
    end

    def initialize(mcc, city, country)
      @mcc = mcc
      @city = city
      @country = country
    end
  end
end