module EREDE
  class Authorization
    attr_accessor :affiliation,
                  :amount,
                  :authorization_code,
                  :card_bin,
                  :card_holder_name,
                  :date_time,
                  :installments,
                  :kind,
                  :last4,
                  :nsu,
                  :origin,
                  :reference,
                  :return_code,
                  :return_message,
                  :status,
                  :subscription,
                  :tid

    def to_json(*)
      {
          affiliation: @affiliation,
          amount: @amount,
          authorizationCode: @authorization_code,
          cardBin: @card_bin,
          cardHolderName: @card_holder_name,
          dateTime: @date_time,
          installments: @installments,
          kind: @kind,
          last4: @last4,
          nsu: @nsu,
          origin: @origin,
          reference: @reference,
          returnCode: @return_code,
          returnMessage: @return_message,
          status: @status,
          subscription: @subscription,
          tid: @tid
      }.delete_if {|k, v| v.nil?}.to_json
    end
  end
end