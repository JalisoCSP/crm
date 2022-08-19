class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_record

  private

  def invalid_record
    redirect_to "/404", alert: "Record not found"
  end
end
