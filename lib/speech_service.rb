require 'rest_client'
require 'base64'

class SpeechService

  def initialize
    @uri = ENV['IBM_BM_URL'] || (raise Exception, "IBM_BM_URL must be defined")
    @user = ENV['IBM_BM_USER'] || (raise Exception, "IBM_BM_USER must be defined")
    @pass = ENV['IBM_BM_PASS'] || (raise Exception, "IBM_BM_PASS must be defined")
    @auth = 'Basic ' + Base64.strict_encode64("#{@user}:#{@pass}").chomp
    _make_resource
  end

  def models
    response = @resource["v1/models"].get
    JSON.parse(response)
  end

  def model(model_id)
    response = @resource["v1/models/#{model_id}"].get
    JSON.parse(response)
  end

  def create_session
  end

  def delete_session(session_id)
  end

  private
  def _make_resource
    @resource = RestClient::Resource.new("#{@uri}", :user => @user, :password => @pass, :verify_ssl => OpenSSL::SSL::VERIFY_NONE)
  end

end
