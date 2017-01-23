class Company < ApplicationRecord
  belongs_to :user
  has_many :company_officers

  alias_method :officers, :company_officers

  def self.new_from_remote remote_company
    new(name: remote_company.name,
        remote_number: remote_company.company_number,
        address: remote_company.formatted_address,
        raw_data: remote_company.raw_data)
  end
end
