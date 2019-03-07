module EREDE
  class Url
    CALLBACK = 'callback'
    THREE_D_SECURE_FAILURE = 'threeDSecureFailure'
    THREE_D_SECURE_SUCCESS = 'threeDSecureSuccess'

    attr_accessor :kind,
                  :url

    def to_json(*)
      {
          kind: @kind,
          url: @url
      }.delete_if {|k, v| v.nil?}.to_json
    end

    def initialize(url, kind = Url::CALLBACK)
      @url = url
      @kind = kind
    end
  end
end