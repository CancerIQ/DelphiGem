require 'spec_helper'

describe Delphi::SurveyToken do 
  it 'get survey token that expires one year from today and has infinity amount of uses' do
    survey_token = Delphi::SurveyToken.get_survey_token( '3c2a8d58-c2e0-4dd7-829a-a2c54bf5ca7f', 365, -1)
    year_from_now = Date.today + 365
    expect(survey_token).to_not eq(nil)
    expect(survey_token.expiration_date).to eq(year_from_now.strftime('%Y-%m-%d'))
    expect(survey_token.number_of_uses_left).to eq(-1)
  end

  it 'get a survey token' do
    survey_token = Delphi::SurveyToken.get_survey_token('3c2a8d58-c2e0-4dd7-829a-a2c54bf5ca7f')
    expect(survey_token).to_not eq(nil)
  end
end

describe Delphi do
  it 'has a version number' do
    expect(Delphi::VERSION).not_to be nil
  end
  it 'set initialization constants' do
    api_key = '111abc'
    host = 'localhost:3001'
    Delphi.setup do |s|
      s.api_key = api_key
      s.host = host
    end
    expect(Delphi.api_key).to eq(api_key)
    expect(Delphi.host).to eq(host)
  end
end

