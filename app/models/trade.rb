# frozen_string_literal: true

class Trade < ActiveRecord::Base
  self.inheritance_column = nil

  TYPES = %w( buy sell )
  validates :type, presence: true, :inclusion => { :in => TYPES }

  belongs_to :user
end
