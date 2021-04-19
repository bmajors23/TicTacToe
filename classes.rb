class Player
    attr_accessor :username, :key, :chosen_numbers
    
    def initialize(username)
        @username = username
        puts "What key would you like to use for this game?"
        @key = gets
        @chosen_numbers = []
    end
end