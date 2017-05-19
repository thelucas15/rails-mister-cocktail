class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates_presence_of :cocktail, presence: true
  validates_presence_of :ingredient, presence: true
  validates :description, presence: true

  validates_uniqueness_of :cocktail_id, :scope => :ingredient_id

end
