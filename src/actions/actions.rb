module Actions
    def self.move_snake(state)
        next_direction = state.current_direction
        next_position = calc_next_position(state)
        # Verificar que la siguiente casilla sea comida
        if position_is_food?(state, next_position)
            state = grow_snake(state, next_position)
            generate_food(state)
        # Verificar que la siguiente casilla sea válida
        elsif position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            end_game(state)
        end
    end

    def self.change_direction(state, direction)
        if next_direction_is_valid?(state, direction)
            state.current_direction = direction
        else
            puts "Invalid direction"
        end
        state
    end

    private

    def self.calc_next_position(state)
        current_position = state.snake.positions.first
        case state.current_direction
        when Model::Direction::UP
            # Decrementar la fila
            return Model::Coordinate.new(current_position.row - 1, current_position.col)
        when Model::Direction::DOWN
            # Incrementar la fila
            return Model::Coordinate.new(current_position.row + 1, current_position.col)
        when Model::Direction::RIGHT
            # Incrementar la columna
            return Model::Coordinate.new(current_position.row, current_position.col + 1)
        when Model::Direction::LEFT
            # Decrementar la columna
            return Model::Coordinate.new(current_position.row, current_position.col - 1)
        end
    end

    def self.position_is_valid?(state, position)
        # Verificar que la posición esté dentro del Grid
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) || (position.col >= state.grid.cols || position.col < 0))
        return false if is_invalid
        # Verificar que la posición no se superponga a la serpiente
        return !(state.snake.positions.include? position)
    end

    def self.move_snake_to(state, next_position)
        new_positions = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_positions
        state
    end

    def self.end_game(state)
        state.game_over = true
        state
    end

    def self.next_direction_is_valid?(state, direction)
        case state.current_direction
        when Model::Direction::UP
            return true if direction != Model::Direction::DOWN
        when Model::Direction::DOWN
            return true if direction != Model::Direction::UP
        when Model::Direction::LEFT
            return true if direction != Model::Direction::RIGHT
        when Model::Direction::RIGHT
            return true if direction != Model::Direction::LEFT
        end
        return false
    end

    def self.position_is_food?(state, next_position)
        state.food.row == next_position.row && state.food.col == next_position.col
    end

    def self.grow_snake(state, next_position)
        state.snake.positions = [next_position] + state.snake.positions
        state
    end

    def self.generate_food(state)
        new_food = Model::Food.new(rand(state.grid.rows), rand(state.grid.cols))
        state.food = new_food
        state
    end
end