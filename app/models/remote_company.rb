class RemoteCompany < CompaniesHouseResource
  attr_accessor :name, :remote_id, :raw_data

  def initialize name, remote_id, raw_data
    self.name = name
    self.remote_id = remote_id
    self.raw_data = raw_data
  end

  def officers
    @officers ||= RemoteOfficer.for_company remote_id
  end

  def formatted_address
    if registered_office_address.present?
      registered_office_address.values.join ', '
    else
      ''
    end
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
      new (api_data['title'] or api_data['company_name']), api_data['company_number'], api_data
    end

    def find id
      result = HTTParty.get api_url + "/company/#{id}", headers: auth_headers

      new(result['company_name'], id, result) if result.code == 200
    end
  end
end
