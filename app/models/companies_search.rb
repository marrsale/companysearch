class CompaniesSearch < CompaniesHouseResource
  delegate :any?, :each, to: :companies

  def initialize query;
    self.query = query
  end

  def companies
    @companies ||= search(query)['items'].map &Company.method(:build)
  end

  def search query
    HTTParty.get api_url + "/search/companies?q=#{query}", headers: auth_headers
  end

  attr_accessor :query
end
