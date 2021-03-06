# Representación del estado del juego

module Model
    module Direction
        UP = :up
        DOWN = :down
        RIGHT = :right
        LEFT = :left
    end

    class Coordinate < Struct.new(:row, :col)
    end

    class Food < Coordinate
    end
    
    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows, :cols)
    end

    class State < Struct.new(:snake, :food, :grid, :current_direction, :game_over, :speed)
        def calculate_speed!
			self.speed = self.speed - (self.speed * 0.05)
		end
    end

    def self.initial_state
        Model::State.new(
            Model::Snake.new([
                Model::Coordinate.new(1,1),
                Model::Coordinate.new(1,0)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false,
            0.5
        )
    end
end