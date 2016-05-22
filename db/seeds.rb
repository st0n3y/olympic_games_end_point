require 'pry-byebug'

require_relative '../models/athlete.rb'
require_relative '../models/event.rb'
require_relative '../models/event_reg.rb'
require_relative '../models/medals_analysis.rb'
require_relative '../models/nation.rb'

EventReg.delete_all
Athlete.delete_all
Nation.delete_all
Event.delete_all

a1 = Athlete.new( {'name' => 'R. Murdoch'} ).save()
a2 = Athlete.new( {'name' => 'E. Doyle'} ).save()
a3 = Athlete.new( {'name' => 'A. Murray'} ).save()

a4 = Athlete.new( {'name' => 'K. Hagino'} ).save()
a5 = Athlete.new( {'name' => 'S. Kubokura'} ).save()
a6 = Athlete.new( {'name' => 'K. Nishikori'} ).save()

a7 = Athlete.new( {'name' => 'K. Czerniak'} ).save()
a8 = Athlete.new( {'name' => 'A. Jesien'} ).save()
a9 = Athlete.new( {'name' => 'L. Kubot'} ).save()


n1 = Nation.new( {'name' => 'Scotland', 'flag' => '../public/flags/scotland.gif', 'athletes' => [a1, a2, a3]} ).save()
n1 = Nation.new( {'name' => 'Japan', 'flag' => '../public/flags/japan.gif', 'athletes' => [a4, a5, a6]} ).save()
n1 = Nation.new( {'name' => 'Poland', 'flag' => '../public/flags/poland.gif', 'athletes' => [a7, a8, a9]} ).save()

e1 = Event.new( {'type' => 'Swimming', 'gold_winner' => 'K. Hagino', 'silver winner' => 'R. Murdoch', 'bronze_winner' => 'K. Czerniak'} ).save()
e2 = Event.new( {'type' => 'Hurdles', 'gold_winner' => 'E. Doyle', 'silver winner' => 'A. Jesien', 'bronze_winner' => 'S. Kubokura'} ).save()
e3 = Event.new( {'type' => 'Tennis', 'gold_winner' => 'A. Murray', 'silver winner' => 'K. Nishikori', 'bronze_winner' => 'L. Kubot'} ).save()