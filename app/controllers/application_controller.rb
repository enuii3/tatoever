class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :render_standard_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActionController::ParameterMissing, with: :render_parameter_missing

  private

  def render_standard_error
    render json: { message: 'エラーが発生しました。システム管理者にお問い合わせください。' }, status: :internal_server_error
  end

  def render_record_not_found
    render json: { message: 'お探しものが見つかりません' }, status: :not_found
  end

  def render_parameter_missing
    render json: { message: 'エラーが発生しました。システム管理者にお問い合わせください。' }, status: :bad_request
  end
end
