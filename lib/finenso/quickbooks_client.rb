class Finenso::QuickbooksClient
  def consumer
    @consumer ||= OAuth::Consumer.new(ENV["QUICKBOOKS_CONSUMER_KEY"], ENV["QUICKBOOKS_CONSUMER_SECRET"],
                                      {
                                        :site                 => "https://oauth.intuit.com",
                                        :request_token_path   => "/oauth/v1/get_request_token",
                                        :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
                                        :access_token_path    => "/oauth/v1/get_access_token"
                                      })
  end

  def access_token
    @access_token ||= OAuth::AccessToken.new(consumer, ENV["QUICKBOOKS_ACCESS_TOKEN"], ENV["QUICKBOOKS_ACCESS_SECRET"])
  end

  def account_service
    service = Quickbooks::Service::Account.new
    service.company_id = ENV["QUICKBOOKS_COMPANY_ID"]
    service.access_token = access_token
    service
  end
end
