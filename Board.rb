class Board
    attr_reader :locations, :size

    def initialize(size=3)
        @size = 3
        @locations = [
            nil,nil,nil,
            nil,nil,nil,
            nil,nil,nil,
        ]
    end

    def taken?(location)
        !empty?(location)
end

def available?(location)
    @locations[location-1] == nil
 end

 def set(location, player)
    locations[location -1] = player
 end

 def render
    puts

 locations.each_slice(size).with_index do |row, index|
  puts "---------" if index !=0
  puts row.map{ |r| mark r }.join("|")
 end
 
 puts
end

  def mark(location)
    location&.mark || " "
  end

  # 0  1  2  3 
  # 4  5  6  7 
  # 8  9  10 11
  # 12 13 14 15

  def win?
    #Horizontals
    locations.each_slice(size) do |slice|
        row = slice.compact
    return row.first if row.length == size && row.all?{ |r| r== row.first}
    end

    # Verticals
    # 0, 4, 8, 12
    # 1, 5, 9, 13
    # 2, 6, 10, 14
    # 3, 7, 11, 15

    size.times do |i|
        row = []
       size.times do |j|
        row << i+ (j * size)
       end

       return row.first if winning_row?(row)
    end

    #Diagonals

    # 0, 5, 10, 15
    # 3, 6, 9, 12
 
    row = []
    size.times do |li|
        row <<(size * i) + i
    end
    return row.first if winning_row?(row)
       
    row = []
    size.times do |li|
        row <<(size * (i+1)) - (i+1)
    end
    return row.first if winning_row?(row)
       
    
    false
  end

  def winning_row?(row)
    row.length == size && row.all?{ |r| r == row.first}
  end

 def draw?
    locations.none?(nil) && !win?
 end
end