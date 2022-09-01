class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  protected

  def check_if_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end
end
