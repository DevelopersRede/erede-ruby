module EREDE
  class Cart
    attr_accessor :billing,
                  :consumer,
                  :environment,
                  :iata,
                  :items,
                  :shipping

    def to_json(*)
      {
          billing: @billing,
          consumer: @consumer,
          environment: @environment,
          iata: @iata,
          items: @items,
          shipping: @shipping
      }.delete_if {|k, v| v.nil?}.to_json
    end

    def address(type = Address::BOTH)
      address = Address.new

      if type & Address::BILLING == Address::BILLING
        @billing = address
      end

      if type & Address::SHIPPING == Address::SHIPPING
        @shipping = address
      end

      address
    end

    def add_item(item)
      if @items == nil
        @items = []
      end

      @items.push(item)

      self
    end

    def add_shipping_address(shipping_address)
      if @shipping == nil
        @shipping = []
      end

      @shipping.push(shipping_address)

      self
    end

    def consumer(name, email, cpf)
      @consumer = Consumer.new(name, email, cpf)
    end
  end
end
    