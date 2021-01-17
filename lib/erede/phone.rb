module EREDE
  class
  Phone
    CELLPHONE = 1
    HOME = 2
    WORK = 3
    OTHER = 4

    attr_accessor :ddd,
                  :number,
                  :type

    def to_json(*)
      {
        ddd: @ddd,
        number: @number,
        type: @type
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize(ddd, number, type = Phone::CELLPHONE)
      @ddd = ddd
      @number = number
      @type = type
    end
  end
end
