class CompaniesController < ApplicationController
  def show
    @company = Company.find params[:id]

    if not @company.present?
      render status: 404
    end
  end
end
