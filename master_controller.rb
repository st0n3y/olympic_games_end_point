require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/athlete.rb'
require_relative './models/nation.rb'
require_relative './models/event.rb'
require_relative './models/event_reg.rb'
require_relative './models/medals_analysis.rb'
require_relative './controllers/athlete_controller.rb'
require_relative './controllers/nation_controller.rb'
require_relative './controllers/event_controller.rb'
require_relative './controllers/medals_analysis_controller.rb'

