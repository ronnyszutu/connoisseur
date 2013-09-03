class Product

	#### SETTERS
	def id=(num)
		@id = num
	end

	def name=(str)
		@name = str
	end

	def origin=(str)
		@origin = str
	end

	def primary_category=(str)
		@primary_category = str
	end

	def secondary_category=(str)
		@secondary_category = str
	end

	def package_unit_type=(str)
		@package_unit_type = str
	end

	def package_unit_volume_in_milliliters=(num)
		@package_unit_volume_in_milliliters = num
	end

	def total_package_units=(num)
		@total_package_units = num
	end

	def alcohol_content=(num)
		@alcohol_content = num
	end

	def inventory_count=(num)
		@inventory_count = num
	end

	def serving_suggestion=(str)
		@serving_suggestion = str
	end

	def tasting_note=(str)
		@tasting_note = str
	end

	def image_thumb_url=(str)
		@image_thumb_url = str
	end

	def image_url=(str)
		@image_url = str
	end

	def price_in_cents=(num)
		@price_in_cents = num
	end

	#### GETTERS
	def id
		@id
	end

	def name
		@name
	end

	def origin
		@origin
	end

	def primary_category
		@primary_category
	end

	def secondary_category
		@secondary_category
	end

	def package_unit_type
		@package_unit_type
	end

	def package_unit_volume_in_milliliters
		@package_unit_volume_in_milliliters
	end

	def total_package_units
		@total_package_units
	end

	def alcohol_content
		@alcohol_content
	end

	def inventory_count
		@inventory_count
	end

	def serving_suggestion
		@serving_suggestion
	end

	def tasting_note
		@tasting_note
	end

	def image_thumb_url
		@image_thumb_url
	end

	def image_url
		@image_url
	end

	def price_in_cents
		@price_in_cents
	end
end