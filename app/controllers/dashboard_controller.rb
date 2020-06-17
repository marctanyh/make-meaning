class DashboardController < ApplicationController
  before_action :set_sidebar
  def index
  end

  def profile 
    @account = Account.find(params[:id])

    @oppourtunities = Oppourtunity.where(account_id: @account.id)
    @oppourtunities_open = Oppourtunity.where(account_id: @account.id).open.count
    @oppourtunities_closed = Oppourtunity.where(account_id: @account.id).closed.count
  end

  private

  def set_sidebar
    @show_sidebar = true if account_signed_in?
  end

end
