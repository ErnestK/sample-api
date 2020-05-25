# frozen_string_literal: true

class TradeSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :price, :shares, :type, :timestamp

  def timestamp
    self.object.timestamp.strftime '%Y-%m-%d %H:%M:%S'
  end

  belongs_to :user
end
