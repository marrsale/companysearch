class CompaniesSearch < CompaniesHouseResource
  attr_accessor :query, :offset

  delegate :any?, :size, :each, to: :companies

  def initialize query, offset=nil
    self.query = query
    self.offset = offset
  end

  def companies
    @companies ||= search(query)['items'].map &RemoteCompany.method(:build)
  end

  def search query
    offset_query = "&" + { start_index: offset }.to_query

    HTTParty.get api_url + "/search/companies?q=#{query}" + "#{offset_query unless offset.nil?}", headers: auth_headers
  end
end
