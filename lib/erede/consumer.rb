module EREDE
  class Consumer
    MALE = 'M'
    FEMALE = 'F'

    attr_accessor :cpf,
                  :documents,
                  :email,
                  :gender,
                  :name,
                  :phone

    def to_json(*)
      {
        cpf: @cpf,
        documents: @documents,
        email: @email,
        gender: @gender,
        name: @name,
        phone: @phone
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize(name, email, cpf)
      @name = name
      @email = email
      @cpf = cpf
    end

    def add_document(type, number)
      if @documents == nil
        @documents = []
      end

      @documents.push(Document.new(type, number))

      self
    end

    def phone(ddd, number, type)
      @phone = Phone.new(ddd, number, type)

      self
    end
  end
end