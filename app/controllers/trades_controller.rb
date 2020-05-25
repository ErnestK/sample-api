# frozen_string_literal: true

class TradesController < ApplicationController
  def index
    render :json => Trade.all, each_serializer: TradeSerializer
  end

  def create
    if Trade.exists? params.permit(:id)
      render :nothing => true, :status => :bad_request and return
    end

    trade = Trade.new params.permit(:symbol, :timestamp, :price, :shares, :type, :id)
    user = User.find_or_initialize_by params[:user].permit(:id, :name)
    trade.user = user

    if trade.save
      render :nothing => true, :status => :created
    else
      render :nothing => true, :status => :internal_server_error
    end
  end

  def erase
    Trade.destroy_all

    render :nothing => true, :status => :ok
  end
end
