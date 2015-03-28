require 'sinatra'
require 'rest-client'

AUTH_TOKEN = ENV['NOTION_API_TOKEN']

api = RestClient::Resource.new('http://demo.getnotion.com/api',
                               headers: {
                                 authorization: "Bearer #{AUTH_TOKEN}" })

get '/' do
  systems = JSON.parse api['/systems'].get
  tasks = JSON.parse api['/tasks'].get
  notifications = JSON.parse api['/notifications'].get
  sensors = JSON.parse api['/sensors'].get

  erb :home, locals: {
    notion_data: {
    systems: systems,
    tasks: tasks,
    notifications: notifications,
    sensors: sensors } }
end

get '/sensors/:id' do
  sensor = JSON.parse api["/sensors/#{params[:id]}"].get
  erb :sensor, locals: { sensor: sensor["sensors"] }
end

get '/systems/:id' do
  system = JSON.parse api["/systems/#{params[:id]}"].get
  erb :system, locals: { system: system["systems"] }
end

get '/tasks/:id' do
  task = JSON.parse api["/tasks/#{params[:id]}"].get
  erb :task, locals: { task: task["tasks"] }
end

get '/notifications/:id' do
  notification = JSON.parse api["/notifications/#{params[:id]}"].get
  erb :notification, locals: { notification: notification["notifications"] }
end
