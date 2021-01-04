# Representación del estado del juego

module Model
    class Coordinate < Struct.new(row, col)

    class Food < Coordinate
    end
    
    class Snake < Struct.new(positions)
    end

    class Grid < Struct.new(rows, cols)
    end

    class State < Struct.new(snake, food, grid)        
    end
end