require 'json'

module EREDE
  class Transaction
    CREDIT = 'credit'
    DEBIT = 'debit'

    ORIGIN_EREDE = 1
    ORIGIN_VISA_CHECKOUT = 4
    ORIGIN_MASTERPASS = 6

    attr_accessor :amount,
                  :authorization,
                  :authorization_code,
                  :brand,
                  :cancel_id,
                  :capture,
                  :card_bin,
                  :card_holder_nameame,
                  :card_number,
                  :cart,
                  :date_time,
                  :distributor_affiliation,
                  :expiration_month,
                  :expiration_year,
                  :iata,
                  :installments,
                  :kind,
                  :last4,
                  :nsu,
                  :origin,
                  :reference,
                  :refund_date_time,
                  :refund_id,
                  :refunds,
                  :request_date_time,
                  :return_code,
                  :return_message,
                  :security_code,
                  :soft_descriptor,
                  :storage_card,
                  :subscription,
                  :three_d_secure,
                  :tid,
                  :urls,
                  :payment_facilitator_id,
                  :sub_merchant

    def to_json(*)
      {
        amount: @amount,
        authorization: @authorization,
        authorizationCode: @authorization_code,
        cancelId: @cancel_id,
        capture: @capture,
        cardBin: @card_bin,
        cardHolderName: @card_holder_name,
        cardNumber: @card_number,
        cart: @cart,
        dateTime: @date_time,
        distributorAffiliation: @distributor_affiliation,
        expirationMonth: @expiration_month,
        expirationYear: @expiration_year,
        iata: @iata,
        installments: @installments,
        kind: @kind,
        last4: @last4,
        nsu: @nsu,
        origin: @origin,
        reference: @reference,
        refundDateTime: @refund_date_time,
        refundId: @refund_id,
        refunds: @refunds,
        requestDateTime: @request_date_time,
        returnCode: @return_code,
        returnMessage: @return_message,
        securityCode: @security_code,
        softDescriptor: @soft_descriptor,
        storageCard: @storage_card,
        subscription: @subscription,
        threeDSecure: @three_d_secure,
        tid: @tid,
        urls: @urls,
        paymentFacilitatorID: @payment_facilitator_id,
        sub_merchant: @sub_merchant
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize(amount = nil, reference = nil)
      @amount = amount
      @reference = reference
    end

    def add_url(url, kind = Url::CALLBACK)
      if @urls == nil
        @urls = []
      end

      @urls.push(Url.new(url, kind))
    end

    def creditcard(card_number, security_code, expiration_month, expiration_year, holder_name)
      card(card_number, security_code, expiration_month, expiration_year, holder_name, Transaction::CREDIT)
    end

    def debitcard(card_number, security_code, expiration_month, expiration_year, holder_name)
      card(card_number, security_code, expiration_month, expiration_year, holder_name, Transaction::DEBIT)
    end

    def card(card_number, security_code, expiration_month, expiration_year, holder_name, kind)
      @card_number = card_number
      @security_code = security_code
      @expiration_month = expiration_month
      @expiration_year = expiration_year
      @card_holder_name = holder_name
      @kind = kind

      self
    end

    def mcc(soft_descriptor, payment_facilitator_id, sub_merchant)
      @soft_descriptor = soft_descriptor
      @payment_facilitator_id = payment_facilitator_id
      @sub_merchant = sub_merchant
    end

    def three_d_secure(on_failure = ThreeDSecure::DECLINE_ON_FAILURE, embed = true, directory_server_transaction_id = "", three_d_indicator = "1")
      @three_d_secure = ThreeDSecure.new
      @three_d_secure.on_failure = on_failure
      @three_d_secure.embedded = embed
      @three_d_secure.directory_server_transaction_id = directory_server_transaction_id
      @three_d_secure.three_d_indicator = three_d_indicator
    end
  end
end