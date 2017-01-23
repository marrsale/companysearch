class RemoteOfficer < CompaniesHouseResource
  attr_accessor :name, :appointed_on, :role, :raw_data

  def initialize name, appointed_on, role, raw_data=nil
    self.name = name
    self.appointed_on = appointed_on
    self.role = role
    self.raw_data = raw_data
  end

  def self.build raw_data
    new raw_data['name'], raw_data['appointed_on'], raw_data['officer_role'], raw_data
  end

  def self.for_company company_no
    result = HTTParty.get api_url + "/company/#{company_no}/officers", headers: auth_headers

    if result.code == 200
      result['items'].map &method(:build)
    else
      []
    end
  end
end
