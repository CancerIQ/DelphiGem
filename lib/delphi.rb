require "delphi/version"
require "delphi/survey_token"
require "typhoeus"
require 'active_support'
require 'json'
require 'pry'

module Delphi
  mattr_accessor :api_key
  @@api_key = '05730126b746059a8df0aadd04fe8372'
  
  mattr_accessor :host
  @@host = 'http://localhost:3001'

  def self.setup
    yield self
  end
end
