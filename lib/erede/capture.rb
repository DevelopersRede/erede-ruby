module EREDE
  class Capture
    attr_accessor :amount,
                  :date_time,
                  :nsu

    def to_json(*)
      {
        amount: @amount,
        dateTime: @date_time,
        nsu: @nsu
      }.delete_if { |k, v| v.nil? }.to_json
    end
  end
end