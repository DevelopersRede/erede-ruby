

module EREDE
  class Antifraud
    attr_accessor :recommendation,
                  :risk_level,
                  :score,
                  :success

    def to_json(*)
      {
          recommendation: @recommendation,
          riskLevel: @risk_level,
          score: @score,
          success: @success
      }.delete_if {|k, v| v.nil?}.to_json
    end
  end
end