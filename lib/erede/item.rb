module EREDE
  class Item
    PHYSICAL = 1
    DIGITAL = 2
    SERVICE = 3
    AIRLINE = 4

    attr_accessor :amount,
                  :description,
                  :discount,
                  :freight,
                  :id,
                  :quantity,
                  :shipping_type,
                  :type

    def to_json(*)
      {
          amount: @amount,
          description: @description,
          discount: @discount,
          freight: @freight,
          id: @id,
          quantity: @quantity,
          shippingType: @shipping_type,
          type: @type
      }.delete_if {|k, v| v.nil?}.to_json
    end

    def initialize(id, quantity, type = Item::PHYSICAL)
      @id = id
      @quantity = quantity
      @type = type
    end
  end
end