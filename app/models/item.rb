class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition
    validates :shipping_fee_id
    validates :prefecture
    validates :shipping_day_id
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition
    validates :shipping_fee_id
    validates :prefecture
    validates :shipping_day_id
  end
end
