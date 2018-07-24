class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	

	# Article.active kodu sadece status true olanları döndürür.
	# Scope'lar belirli şartlara göre veri çekmemizi sağlar.
	scope :active, -> {where(status: true)}

end
