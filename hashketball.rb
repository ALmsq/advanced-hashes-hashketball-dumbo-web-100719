def game_hash 
 hash =  {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson", :number => 0,:shoe => 16,:points => 22,:rebounds => 12,:assists => 12 ,:steals => 3,:blocks => 1,:slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans", :number => 30,:shoe => 14,:points => 12,:rebounds => 12,:assists => 12 ,:steals => 12,:blocks => 12,:slam_dunks => 7
        },
        {
        :player_name => "Brook Lopez", :number => 11,:shoe => 17,:points => 17,:rebounds => 19,:assists => 10 ,:steals => 3,:blocks => 1,:slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee", :number => 1,:shoe => 19,:points => 26,:rebounds => 11 ,:assists => 6,:steals => 3,:blocks => 8,:slam_dunks => 5
        },
        {
        :player_name => "Jason Terry", :number => 31,:shoe => 15,:points => 19,:rebounds => 2 ,:assists => 2,:steals => 4,:blocks => 11,:slam_dunks => 1
        }
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien", :number => 4,:shoe => 18,:points => 10,:rebounds => 1,:assists => 1,:steals => 2,:blocks => 7,:slam_dunks => 2
        },
        {
        :player_name => "Bismack Biyombo", :number => 0,:shoe => 16, :points => 12,:rebounds => 4,:assists => 7,:steals => 22,:blocks => 15,:slam_dunks => 10
        },
        {
        :player_name => "DeSagna Diop", :number => 2, :shoe => 14,:points => 24,:rebounds => 12,:assists => 12,:steals => 4,:blocks => 5,:slam_dunks => 5
        },
        {
        :player_name => "Ben Gordon", :number => 8,:shoe => 15,:points => 33,:rebounds => 3,:assists => 2,:steals => 1,:blocks => 1,:slam_dunks => 0
        },
        {
        :player_name => "Kemba Walker", :number => 33,:shoe => 15,:points => 6,:rebounds => 12,:assists => 12,:steals => 7,:blocks => 5,:slam_dunks => 12
        }
        ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team, n|
    n.each do |a, b|
    if a == :players
      b.each do |player|
        if name == player[:player_name]
        return player[:points]
        end
      end
    end
  end
end
end

def shoe_size(name)
    game_hash.each do |team, n|
    n.each do |a, b|
    if a == :players
      b.each do |player|
        if name == player[:player_name]
        return player[:shoe]
        end
      end
    end
  end
end
end

def team_colors(color)
  game_hash.each {|team, info|
  info.each {|desc, attribute|
    
      if color == info[:team_name]
        return info[:colors]
      end
    }
  }
end

def team_names
arr = []
  game_hash.each{|team, info|
   arr << info[:team_name]
  }
  arr
end


def player_numbers(team)
  arr = []
  game_hash.each{|teams, info|
  if team == info[:team_name]
    info[:players].each{|player|
      arr << player[:number]
    }
    end
  }
arr
end

def player_stats(name)
    game_hash.each {|team, info|
       info[:players].each{|stats|
        if name == stats[:player_name]
          return stats.reject{|key, value|
            key == :player_name
          }   
          end
       }  
    }
end

def big_shoe_rebounds
  arr = []
  game_hash.each{|team, info|
    info[:players].each{|stats, value|
      arr << stats[:shoe]
    }
    
      info[:players].each{|stats|
      if arr.max == stats[:shoe]
        return stats[:rebounds] 
      end
      }
  }
end

def most_points_scored
most_points = 0
player = ""
  game_hash.each{|team, info| 
    info[:players].each{|stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        player = stats[:player_name]
        end
    }
    
  }
    return player
end

def winning_team
  home = []
  away = []

  game_hash.each{|team, info|
    if info[:team_name] == "Brooklyn Nets"
      info[:players].each{|stats|
        home << stats[:points]
      }
  end
  if info[:team_name] == "Charlotte Hornets"
      info[:players].each{|stats|
        away << stats[:points]
      }
  end
  if home.sum > away.sum
    return "Brooklyn Nets"
    else
    return "Charlotte Hornets"
    end
    
 }

end

def player_with_longest_name
longest_name = 0
player = ""
  game_hash.each{|team, info| 
    info[:players].each{|stats|
      if stats[:player_name].length > longest_name
        longest_name = stats[:player_name].length
        player = stats[:player_name]
        end
    }
  }
  return player
end

def long_name_steals_a_ton?
  most_steals = 0
  player = ""
  game_hash.each{|team, info| 
    info[:players].each{|stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player = stats[:player_name]
        end
    }
  }
 return player == player_with_longest_name ? true : false
end
