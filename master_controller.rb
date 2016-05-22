require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'

require_relative './models/athlete.rb'
require_relative './models/nation.rb'
require_relative './models/event.rb'
require_relative './models/event_reg.rb'
require_relative './medals_analysis.rb'
require_relative './controllers/athlete.rb'
require_relative './controllers/nation.rb'
require_relative './controllers/event.rb'
require_relative './controllers/medals_analysis.rb'

