# Representación del estado del juego

module Model
    class Coordinate < Struct.new(:row, :col)
    end

    class Food < Coordinate
    end
    
    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows, :cols)
    end

    class State < Struct.new(:snake, :food, :grid)
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coordinate.new(1,1),
                Model::Coordinate.new(1,0)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12)
        )
    end
end