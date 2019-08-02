# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
JoinTableSpecialtyDoctor.destroy_all
City.destroy_all

specialtyA = Specialty.create(name: "generaliste")
specialtyB = Specialty.create(name: "dentiste")
specialtyC = Specialty.create(name: "chirurgiste")
specialtyD = Specialty.create(name: "allergologue")
specialtyE = Specialty.create(name: "anesthésiologue")
specialtyF = Specialty.create(name: "andrologue")
specialtyG = Specialty.create(name: "cardiologue")
specialtyH = Specialty.create(name: "dermatologue")
specialtyI = Specialty.create(name: "gynécologue")
specialtyJ = Specialty.create(name: "hématologue")

puts "10 specialties créés"

cityA = City.create(name: 'Antananarivo')
cityB = City.create(name: 'Majunga')
cityC = City.create(name: 'Tamatave')
cityD = City.create(name: 'Tuléar')
cityE = City.create(name: "Diégo")

puts "5 villes créés"

100.times do

doctor = Doctor.create(first_name: "DR.#{Faker::Name.first_name}", last_name: Faker::Name.last_name, zip_code: rand(10000..80000))
  doctor.city = [cityA, cityB, cityC, cityD, cityE].sample
  doctor.save
  patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  patient.city = [cityA, cityB, cityC, cityD, cityE].sample
  patient.save
  appointment = Appointment.create(doctor: doctor, patient: patient)
  appointment.city = [cityA, cityB, cityC, cityD, cityE].sample
  appointment.save

  join_table_specialty_doctor =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialtyA, specialtyB, specialtyC, specialtyD, specialtyE])
  join_table_specialty_doctor2 =  JoinTableSpecialtyDoctor.create(doctor: doctor, specialty: [specialtyF, specialtyG, specialtyH, specialtyI, specialtyJ])
end

puts "Toute les tables ont été remplies"