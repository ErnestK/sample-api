# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    unless User.exists? params.permit(:id)
      render :nothing => true, :status => :not_found and return
    end

    #  TODO: n+1 ?
    render :json => User.find_by(params.permit(:id)).trades.order(:id), each_serializer: TradeSerializer
  end
end
