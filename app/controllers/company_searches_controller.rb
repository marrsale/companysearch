class CompanySearchesController < ApplicationController
  def new; end

  def create
    # regularize query as GET param, allowing for user to hit back and for pagination
    redirect_to company_search_path q: params[:company_search][:company_name]
  end

  def show
    @company_search = CompaniesSearch.new params[:q]
  end
end
