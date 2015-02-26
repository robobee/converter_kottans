class Convert::BaseController < ::ApplicationController
  include ActionController::MimeResponds

  before_filter :check_params, only: [:c2f, :f2c]

  def check_params
    respond_to do |format|
      format.json { render json: {error: 'Value is in wrong format'} }
    end unless is_float?(params[:value])
  end

  private
  
  def is_float? str
    !!Float(str) rescue false
  end
end
