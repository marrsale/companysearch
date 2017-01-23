class CompaniesHouseResource
  include HTTParty

  # this pattern (.foo -> #foo) is a smell
  def self.api_url
    "https://api.companieshouse.gov.uk"
  end

  def api_url
    self.class.api_url
  end

  def self.auth_headers
    { 'Authorization' => "Basic #{ENV['companies_house_api_key']}" }
  end

  def auth_headers
    self.class.auth_headers
  end
end
