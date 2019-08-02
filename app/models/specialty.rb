class Specialty < ApplicationRecord
	has_many :jion_table_specialty_doctor
	has_many :doctors, through: :jion_table_specialty_doctor
end
