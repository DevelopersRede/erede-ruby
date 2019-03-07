require "erede/service/create_transaction_service"
require "erede/service/capture_transaction_service"
require "erede/service/cancel_transaction_service"
require "erede/service/get_transaction_service"
require "erede/version"
require "erede/iata.rb"
require "erede/authorization.rb"
require "erede/document.rb"
require "erede/antifraud.rb"
require "erede/threedsecure.rb"
require "erede/capture.rb"
require "erede/consumer.rb"
require "erede/transaction.rb"
require "erede/submerchant.rb"
require "erede/item.rb"
require "erede/phone.rb"
require "erede/url.rb"
require "erede/refund.rb"
require "erede/version.rb"
require "erede/environment.rb"
require "erede/store.rb"
require "erede/passenger.rb"
require "erede/flight.rb"
require "erede/address.rb"
require "erede/cart.rb"
require "erede.rb"
require "json"

module EREDE
  USER_AGENT = 'eRede/1.0 (SDK Ruby)'

  class ERede
    attr_accessor :store

    # @param store [Store]
    def initialize(store)
      @store = store
    end

    def authorize(transaction)
      create(transaction)
    end

    def create(transaction)
      service = EREDE::SERVICE::CreateTransactionService.new(@store, transaction)

      service.execute()
    end

    def cancel(transaction)
      service = EREDE::SERVICE::CancelTransactionService.new(@store, transaction)

      service.execute()
    end

    def capture(transaction)
      service = EREDE::SERVICE::CaptureTransactionService.new(@store, transaction)

      service.execute()
    end

    def get_by_id(tid)
      service = EREDE::SERVICE::GetTransactionService.new(@store)
      service.tid = tid

      service.execute()
    end

    def get_by_reference(reference)
      service = EREDE::SERVICE::GetTransactionService.new(@store)
      service.reference = reference

      service.execute()
    end

    def get_refunds(tid)
      service = EREDE::SERVICE::GetTransactionService.new(@store)
      service.tid = tid
      service.refund = true

      service.execute()
    end

    def zero(transaction)
      amount = transaction.amount
      capture = transaction.capture

      transaction.amount = 0
      transaction.capture = true
      transaction = create(transaction)
      transaction.amount = amount
      transaction.capture = capture
      transaction
    end
  end
end
