# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def num_points_scored name
  game_hash.each do |ground, ground_hash|
    ground_hash[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end
# puts num_points_scored("Jeff Adrien")

def shoe_size name 
  game_hash.each do |ground, ground_hash|
    ground_hash[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end
# puts shoe_size("Jeff Adrien")

def team_colors team_name
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  end
end
# puts team_colors("Brooklyn Nets")

def team_names
  game_hash.map { |team, team_data| team_data[:team_name] }
end
# puts team_names

def player_numbers team_name
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:players].map { |player| player[:number] }
    end
  end
end
# puts player_numbers("Brooklyn Nets")

def player_stats player_name
    game_hash.each do |team, team_hash|
      team_hash[:players].each  do |player|
        if player[:player_name] == player_name
          return player
        end
      end
    end
end
puts player_stats("Jeff Adrien")

def big_shoe_rebounds
  largest_shoe_size = 0
  rebounds = 0

  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:shoe] > largest_shoe_size
        largest_shoe_size = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end

  rebounds
end
puts big_shoe_rebounds

def most_points_scored
  most_points = 0
  player_with_most_points = ""

  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        player_with_most_points = player[:player_name]
      end
    end
  end

  player_with_most_points
end
puts most_points_scored

def winning_team
  home_team_points = 0
  away_team_points = 0

  game_hash[:home][:players].each do |player|
    home_team_points += player[:points]
  end

  game_hash[:away][:players].each do |player|
    away_team_points += player[:points]
  end

  home_team_points > away_team_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end
puts winning_team

def player_with_longest_name
  longest_name = ""
  max_length = 0

  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:player_name].length > max_length
        max_length = player[:player_name].length
        longest_name = player[:player_name]
      end
    end
  end

  longest_name
end
puts player_with_longest_name

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = ""

  game_hash.each do |team, team_data|
    team_data[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        player_with_most_steals = player[:player_name]
      end
    end
  end

  player_with_most_steals == player_with_longest_name
end
puts long_name_steals_a_ton?

