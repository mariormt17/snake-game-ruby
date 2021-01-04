module Actions
    def self.move_snake(state)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # Verificar que la siguiente casilla sea válida
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            end_game(state)
        end
    end

    private

    def calc_next_position(state)
        current_position = state.snake.positions.first
        case state.next_direction
        when UP
            # Decrementar la fila
            return Model::Coordinate.new(current_position.row - 1, current_position.col)
        when DOWN
            # Incrementar la fila
            return Model::Coordinate.new(current_position.row + 1, current_position.col)
        when RIGHT
            # Incrementar la columna
            return Model::Coordinate.new(current_position.row, current_position.col + 1)
        when LEFT
            # Decrementar la columna
            return Model::Coordinate.new(current_position.row, current_position.col - 1)
        end
    end

    def position_is_valid?(state, next_position)
    end

    def move_snake_to(state, next_position)
    end

    def end_game(state)
    end
end