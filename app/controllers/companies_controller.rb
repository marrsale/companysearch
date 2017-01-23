class CompaniesController < ApplicationController
  def create
    @remote_company = RemoteCompany.find params[:company_number]
    @company = Company.new_from_remote @remote_company
    @company.user = current_user

    @company_officers = @remote_company.officers.map do |officer|
      @company.officers.build name: officer.name, raw_data: officer.raw_data
    end

    if @company.save and @company_officers.all?(&:save)
      redirect_to companies_path
    else
      redirect_to remote_company_path(params[:company_number])
    end
  end

  def index
    @companies = current_user.companies
  end

  def show
    @company = Company.find params[:id]
  end
end
