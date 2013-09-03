require "json"
require "open-uri"
require "./product"

class HtmlGenerator
	def initialize
		# # puts "HtmlGenerator: index"
		# raw_response = open("http://lcboapi.com/products").read
		# # Parse JSON­formatted text into a Ruby Hash
		# parsed_response = JSON.parse(raw_response)
		# # Return the actual result data from the response, ignoring metadata
		# parsed_collection = parsed_response["result"]
		# parsed_collection.each do | index |
		# 	puts index["id"]
		# end

		do_parsing
	end

	def do_parsing
		continue_parsing = true
		page_num = 1
		@products = Hash.new

		while continue_parsing == true
			raw_response = open("http://lcboapi.com/products?page=#{page_num}").read
			parsed_response = JSON.parse(raw_response)
			collection = parsed_response["result"]

			collection.each do |index|
				if index.has_key?("id")
					prod = Product.new
					prod.id=(index["id"])
					prod.name=(index["name"])
					prod.origin=(index["origin"])
					prod.primary_category=(index["primary_category"])
					prod.secondary_category=(index["secondary_category"])
					prod.package_unit_type=(index["package_unit_type"])
					prod.package_unit_volume_in_milliliters=(index["package_unit_volume_in_milliliters"])
					prod.total_package_units=(index["total_package_units"])
					prod.alcohol_content=(index["alcohol_content"])
					prod.inventory_count=(index["inventory_count"])
					prod.serving_suggestion=(index["serving_suggestion"])
					prod.tasting_note=(index["tasting_note"])
					prod.image_thumb_url=(index["image_thumb_url"])
					prod.image_url=(index["image_url"])
					prod.price_in_cents=(index["price_in_cents"])
				else
					continue_parsing = false
				end
				@products.merge! prod.id => prod
			end
			page_num += 1

			break if page_num == 6
			sleep 20
		end
	end

	def index
		print_header
		@products.each_value do | product |
			puts "<li>"
			puts "<div class='product_image_thumb'><img src='#{product.image_thumb_url}'</div>"
			puts "<ul class='product'>"
			puts "<li class='name'>#{product.name}</li>"	
			puts "<li class='id'>Item ID: #{product.id}</li>"
			puts "<li class='origin'>Product of #{product.origin}</li>"
			cost = "%.2f" % (product.price_in_cents.to_f/100)
			puts "<li class='package_and_cost'>#{product.total_package_units} x #{product.package_unit_type}s (#{product.package_unit_volume_in_milliliters}ml) @ $#{cost}</li>"
			puts "<li class='serving_suggestion'>#{product.serving_suggestion}</li>" 
			puts "</ul>"
			puts "</li>"
		end
		print_footer
	end

	def show(product_id)
		# write the same as the index method but passing a product_id in
		product = @products.fetch(product_id.to_i)

		print_header
		puts "<li>"
		puts "<div class='product_image_thumb'><img src='#{product.image_thumb_url}'</div>"
		puts "<ul class='product'>"
		puts "<li class='name'>#{product.name}</li>"	
		puts "<li class='id'>Item ID: #{product.id}</li>"
		puts "<li class='origin'>Product of #{product.origin}</li>"
		cost = "%.2f" % (product.price_in_cents.to_f/100)
		puts "<li class='package_and_cost'>#{product.total_package_units} x #{product.package_unit_type}s (#{product.package_unit_volume_in_milliliters}ml) @ $#{cost}</li>"
		puts "<li class='serving_suggestion'>#{product.serving_suggestion}</li>"
		puts "</ul>"
		puts "</li>"
		print_footer
	end

	def print_header
		puts "<!DOCTYPE html>"
		puts "<html>"
		puts "<head>"
		puts "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">"
		puts "<title>Connoisseur</title>"
		puts "</head>"
		puts "<body>"
		puts "<h1>Connoisseur App</h1>"
		puts "<ul class='product_list'>"
	end

	def print_footer
		puts "</ul>"
		puts "</body>"
		puts "</html>"
	end
end