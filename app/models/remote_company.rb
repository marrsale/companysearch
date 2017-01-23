class RemoteCompany < CompaniesHouseResource
  attr_accessor :name, :remote_id, :raw_data

  def initialize name, remote_id, raw_data
    self.name = name
    self.remote_id = remote_id
    self.raw_data = raw_data
  end

  def officers
    @officers ||= Officer.for_company remote_id
  end

  def method_missing method
    if raw_data.present? and raw_data[method.to_s].present?
      raw_data[method.to_s]
    else
      super
    end
  end

  class << self
    def build api_data
      new api_data['title'], api_data['company_number'], api_data
    end

    def find id
      result = HTTParty.get api_url + "/company/#{id}", headers: auth_headers

      new(result['company_name'], id, result) if result.code == 200
    end
  end

  class Officer < CompaniesHouseResource
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
end
