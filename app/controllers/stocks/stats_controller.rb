# frozen_string_literal: true

module Stocks
  class StatsController < ApplicationController
    def price
      if Trade.find_by_symbol(params[:stock_symbol]).blank?
        render :nothing => true, :status => :not_found and return
      end

      prices = Trade.where(symbol: params[:stock_symbol])
                    .where('date(timestamp) between date(?) and date(?)', params[:start].to_datetime, params[:end].to_datetime)
                    .pluck(:price)
      data = Struct.new(:lowest, :highest, :symbol).new(prices.min, prices.max , params[:stock_symbol])

      if prices.present?
        render :json => PriceStatsSerializer.new(data).to_json
      else
        render :json => { "message":"There are no trades in the given date range" }
      end
    end

    def search

    end
  end
end
