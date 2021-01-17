module EREDE
  class Brand
    attr_accessor :name,
                  :return_code,
                  :return_message

    def initialize(name, return_code, return_message)
      @name = name
      @return_code = return_code
      @return_message = return_message
    end
  end
end