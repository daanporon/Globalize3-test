class Product < ActiveRecord::Base
  
  translates :title, :description
  
  validates :title, :presence => true
  validates :description, :presence => true
  
  scope :with_current_locale, with_translations.with_locales(I18n.locale)
  
end
