module EREDE
  class ThreeDSecure
    CONTINUE_ON_FAILURE = 'continue'
    DECLINE_ON_FAILURE = 'decline'

    attr_accessor :cavv,
                  :eci,
                  :embedded,
                  :on_failure,
                  :url,
                  :user_agent,
                  :xid,
                  :three_d_indicator,
                  :directory_server_transaction_id

    def to_json(*)
      {
        cavv: @cavv,
        eci: @eci,
        embedded: @embedded,
        onFailure: @on_failure,
        url: @url,
        userAgent: @user_agent,
        xid: @xid,
        threeDIndicator: @three_d_indicator,
        DirectoryServerTransactionId: @directory_server_transaction_id
      }.delete_if { |k, v| v.nil? }.to_json
    end

    def initialize
      @embedded = true
      @three_d_indicator = "1"
      @user_agent = EREDE::USER_AGENT
    end
  end
end