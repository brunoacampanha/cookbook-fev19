class Recipe < ApplicationRecord
  
  validates :title, presence: true
  validates :recipe_type, presence: true
  validates :difficulty, presence: true
  validates :cuisine, presence: true
  validates :cook_time, presence: true
  validates :cook_time, numericality: { other_than: 0, message: 'Tempo de preparo tem que ser maior que zero!' }
  validates :cook_time, numericality: { greater_than: 0, message: 'Tempo de preparo não pode ser negativo' }
  validates :ingredients, presence: true
  validates :cook_method, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
