require 'pg'

get '/medals/?' do
  nations = Nation.all()
  @medals_analysis = MedalsAnalysis.new( nations )
  @ranked_nations = @medals_analysis.points_ranking
  erb :'medals/medals'
end