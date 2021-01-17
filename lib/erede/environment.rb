module EREDE
  class Environment
    PRODUCTION = "https://api.userede.com.br/erede"
    SANDBOX = "https://api.userede.com.br/desenvolvedores"
    VERSION = "v1"

    attr_accessor :ip,
                  :session_id,
                  :endpoint

    def initialize(endpoint, version = Environment::VERSION)
      @endpoint = "#{endpoint}/#{version}/"
    end

    def self.production
      Environment.new(Environment::PRODUCTION)
    end

    def self.sandbox
      Environment.new(Environment::SANDBOX)
    end

    def to_json(*)
      { consumer:
          {
            ip: @ip,
            sessionId: @session_id
          }
      }.delete_if { |k, v| v.nil? }.to_json
    end
  end
end