class Product < ApplicationRecord
  has_one_attached :image

  has_many :technical_data, dependent: :destroy
  has_many :ordering_informations, dependent: :destroy
  has_many :connection_data, dependent: :destroy
  has_many :dimensions, dependent: :destroy

  accepts_nested_attributes_for :technical_data, allow_destroy: true
  accepts_nested_attributes_for :ordering_informations, allow_destroy: true
  accepts_nested_attributes_for :connection_data, allow_destroy: true
  accepts_nested_attributes_for :dimensions, allow_destroy: true
end
