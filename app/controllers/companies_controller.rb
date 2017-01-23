class CompaniesController < ApplicationController
  def show
    @company = RemoteCompany.find params[:id]

    if not @company.present?
      render status: 404
    end
  end
end
