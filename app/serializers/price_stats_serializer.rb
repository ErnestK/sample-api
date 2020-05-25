# frozen_string_literal: true

class PriceStatsSerializer < ActiveModel::Serializer
  attributes :highest, :lowest, :symbol

  def symbol
    self.object.symbol
  end

  def highest
    self.object.highest
  end

  def lowest
    self.object.lowest
  end
end
