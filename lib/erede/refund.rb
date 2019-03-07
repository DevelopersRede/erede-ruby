module EREDE
  class Refund
    attr_accessor :amount,
                  :refund_date_time,
                  :refund_id,
                  :status

    def to_json(*)
      {
          amount: @amount,
          refundDateTime: @refund_date_time,
          refundId: @refund_id,
          status: @status
      }.delete_if {|k, v| v.nil?}.to_json
    end
  end
end