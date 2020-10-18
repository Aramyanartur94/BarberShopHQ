#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'tux'

set :database, { adapter: 'sqlite3', database: "barbersshop.db" }

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index	
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	#@username = params[:username]
	#@phone = params[:phone]
	#@datetime = params[:datetime]
	#@barber = params[:barber]
	#@color = params[:color]
	
	# Первый вариант (ламерский)
	# Client.create :name => @username, :phone => @phone, :datestamp => @datetime, :barber => @barber, :color => @color
	
	# Второй вариант (ламерский)
	#c = Client.new
	#c.name = @username
	#c.phone = @phone
	#c.datestamp = @datetime
	#c.barber = @barber
	#c.color = @color
	#c.save

	#Сохранение в базу (ПРАВИЛЬНЫЙ СПОСОБ) 
	c = Client.new params[:client]
	if c.save
		erb "<h2>Спасибо, что записались!</h2>"
	else
		@error = c.errors.full_messages.first
		erb :visit
	end
end

post '/contacts' do
	@personname = params[:personname]
	@useremail = params[:useremail]
	@question = params[:question]
	Contact.create :name => @personname, :useremail => @useremail, :question => @question

erb "Спасибо за вопрос. Ответ мы отправим на вашу электронную почту в ближайшее время!"	

end
