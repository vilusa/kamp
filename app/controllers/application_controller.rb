class ApplicationController < ActionController::Base
	# === RecordNotFound Kontrolü
	#Kayıt bulunamadığı durumlarda 404 hata sayfasına yönlendirir
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	# rescue_from
	def record_not_found
		render plain: "404 Not Found", status: 404
	end
	# === end
end
