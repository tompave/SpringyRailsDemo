class GraphController < ApplicationController


  # GET / - root_path
  def home
    @names = Person.pluck(:name)
    if params[:graph] == "complex"
      @type = "complex"
      @participations = {}
      Person.all.each do |person|
        @participations[person.name] = person.party_participations.map do |participation|
          { name: participation.attended_party.organizer.name, confirmed: participation.confirmed, weight: 0.6 }
        end
      end
      #puts @participations.inspect.colorize :blue
    else
      @type = "simple"
      @friendships = {}
      Person.all.each do |person|
        @friendships[person.name] = person.friends.pluck(:name)
      end
    end
  end
  
  
  # using a has_and_belongs_to_many association
  # POST /random_simple - random_simple_path
  def random_simple
    prepare_people
    redirect_to :root
  end


  # using a has_many :through association
  # POST /random_complex - random_complex_path
  def random_complex
    prepare_people
    prepare_parties
    redirect_to action: "home", graph: "complex"
  end






  private

    def prepare_people(n = 10, m = 3)
      Person.destroy_all

      n.times do |i|
        Person.create
      end
      
      prng = Random.new()
      people = Person.all
      r = 0..n-1
      (n*m).times do |i|
        people[prng.rand(r)].befriend(people[prng.rand(r)])
      end
    end



    def prepare_parties(n = 7, m = 3)
      Party.destroy_all
      PartyParticipation.destroy_all

      n.times do |i|
        p = Person.create
      end
      
      prng = Random.new()
      people = Person.all
      people_r = 0..n-1

      (n*m).times do |i|
        people[prng.rand(people_r)].own_parties.create
      end

      parties = Party.all
      parties_r = 0..(n*m -1)
      bools = [true, false]

      (n*m*2).times do |i|
        parties[prng.rand(parties_r)].attend!(people[prng.rand(people_r)], bools.sample)
      end
    end
  
end







