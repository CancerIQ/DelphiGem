module Delphi
  class SurveyToken
     attr_reader :id, :survey_id, :expiration_date, :number_of_uses_left
    
    def initialize(args)
      @id = args['id']
      @survey_id = args["survey_id"]
      @expiration_date = args["expiration_date"]
      @number_of_uses_left = args["number_of_uses_left"]
    end

    def self.get_survey_token(survey_id, days_until_expiry= nil, num_uses=nil)
      token_params = {
        survey_id: survey_id,
        days_until_expiry: days_until_expiry,
        num_uses: num_uses
      }
      request = Typhoeus::Request.new(
                # 'http://questionnaire-api.cancer-iq.com/api/v1/survey_tokens.json',
                Delphi.host + '/api/v1/survey_tokens.json',
                method: :post,
                body: token_params,
                headers: { Authorization: "Token token=#{Delphi.api_key}"},
                ssl_verifypeer: false,
                ssl_verifyhost: 0,
                verbose: true,
              )
      request.on_complete do |response|
        if response.success?
          survey_token_hash = JSON response.body
          return SurveyToken.new(survey_token_hash)
        else
          puts JSON response.body
          return nil
        end
      end
      request.run
    end
  end
end