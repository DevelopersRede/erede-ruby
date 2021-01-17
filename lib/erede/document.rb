module EREDE
  class Document
    attr_accessor :type,
                  :number

    def to_json(*)
      {
        type: @type,
        number: @number
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize(type, number)
      @type = type
      @number = number
    end
  end
end