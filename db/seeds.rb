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


n1 = Nation.new( {'name' => 'Scotland', 'flag' => 'scotland.gif'} ).save()
n2 = Nation.new( {'name' => 'Japan', 'flag' => 'japan.gif'} ).save()
n3 = Nation.new( {'name' => 'Poland', 'flag' => 'poland.gif'} ).save()


a1 = Athlete.new( {'name' => 'R. Murdoch', 'nation_id' => n1.id} ).save()
a2 = Athlete.new( {'name' => 'E. Doyle', 'nation_id' => n1.id} ).save()
a3 = Athlete.new( {'name' => 'A. Murray', 'nation_id' => n1.id} ).save()

a4 = Athlete.new( {'name' => 'K. Hagino', 'nation_id' => n2.id} ).save()
a5 = Athlete.new( {'name' => 'S. Kubokura', 'nation_id' => n2.id} ).save()
a6 = Athlete.new( {'name' => 'K. Nishikori', 'nation_id' => n2.id} ).save()

a7 = Athlete.new( {'name' => 'K. Czerniak', 'nation_id' => n3.id} ).save()
a8 = Athlete.new( {'name' => 'A. Jesien', 'nation_id' => n3.id}  ).save()
a9 = Athlete.new( {'name' => 'L. Kubot', 'nation_id' => n3.id} ).save()

a10 = Athlete.new( {'name' => 'D. Purvis', 'nation_id' => n1.id} ).save()
a11 = Athlete.new( {'name' => 'K. Uchimura', 'nation_id' => n2.id} ).save()
a12 = Athlete.new( {'name' => 'R. Kulesza', 'nation_id' => n3.id} ).save()

# n1.athletes = [a1, a2, a3]
# n2.athletes = [a4, a5, a6]
# n3.athletes = [a7, a8, a9]

# n1.update
# n2.update
# n3.update

e1 = Event.new( {'type' => 'Swimming', 'gold_winner' => a4.id, 'silver_winner' => a1.id, 'bronze_winner' => a7.id} ).save()
e2 = Event.new( {'type' => 'Hurdles', 'gold_winner' => a2.id, 'silver_winner' => a8.id, 'bronze_winner' => a5.id} ).save()
e3 = Event.new( {'type' => 'Tennis', 'gold_winner' => a3.id, 'silver_winner' => a6.id, 'bronze_winner' => a9.id} ).save()
e4 = Event.new( {'type' => 'Gymnastics', 'gold_winner' => a10.id, 'silver_winner' => a11.id, 'bronze_winner' => a12.id} ).save()


er1 = EventReg.new( {'event_id' => e1.id, 'athlete_id' => a1.id} ).save()
er2 = EventReg.new( {'event_id' => e1.id, 'athlete_id' => a4.id} ).save()
er3 = EventReg.new( {'event_id' => e1.id, 'athlete_id' => a7.id} ).save()
er4 = EventReg.new( {'event_id' => e2.id, 'athlete_id' => a2.id} ).save()
er5 = EventReg.new( {'event_id' => e2.id, 'athlete_id' => a5.id} ).save()
er6 = EventReg.new( {'event_id' => e2.id, 'athlete_id' => a8.id} ).save()
er7 = EventReg.new( {'event_id' => e3.id, 'athlete_id' => a3.id} ).save()
er8 = EventReg.new( {'event_id' => e3.id, 'athlete_id' => a6.id} ).save()
er9 = EventReg.new( {'event_id' => e3.id, 'athlete_id' => a9.id} ).save()
er10 = EventReg.new( {'event_id' => e4.id, 'athlete_id' => a10.id} ).save()
er11 = EventReg.new( {'event_id' => e4.id, 'athlete_id' => a11.id} ).save()
er12 = EventReg.new( {'event_id' => e4.id, 'athlete_id' => a12.id} ).save()


# a1 = Athlete.new( {'name' => 'R. Murdoch', 'nation_id' => '1'} ).save()
# a2 = Athlete.new( {'name' => 'E. Doyle', 'nation_id' => '1'} ).save()
# a3 = Athlete.new( {'name' => 'A. Murray', 'nation_id' => '1'} ).save()

# a4 = Athlete.new( {'name' => 'K. Hagino', 'nation_id' => '2'} ).save()
# a5 = Athlete.new( {'name' => 'S. Kubokura', 'nation_id' => '2'} ).save()
# a6 = Athlete.new( {'name' => 'K. Nishikori', 'nation_id' => '2'} ).save()

# a7 = Athlete.new( {'name' => 'K. Czerniak', 'nation_id' => '3'} ).save()
# a8 = Athlete.new( {'name' => 'A. Jesien', 'nation_id' => '3'}  ).save()
# a9 = Athlete.new( {'name' => 'L. Kubot', 'nation_id' => '3'} ).save()


# n1 = Nation.new( {'name' => 'Scotland', 'flag' => '../public/flags/scotland.gif', 'athletes' => [a1, a2, a3]} ).save()
# n1 = Nation.new( {'name' => 'Japan', 'flag' => '../public/flags/japan.gif', 'athletes' => [a4, a5, a6]} ).save()
# n1 = Nation.new( {'name' => 'Poland', 'flag' => '../public/flags/poland.gif', 'athletes' => [a7, a8, a9]} ).save()