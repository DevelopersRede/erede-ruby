

module EREDE
  class Store
    attr_accessor :token,
                  :pv,
                  :environment

    # @param token [String] Token
    # @param pv [String] PV
    # @param environment [Environment] The environment
    def initialize(token, pv, environment = nil)
      environment ||= Environment.production

      @token = token
      @pv = pv
      @environment = environment
    end

    def to_json(*)
      {
          token: @token,
          pv: @pv
      }.delete_if { |k, v| v.nil? }.to_json
    end
  end
end