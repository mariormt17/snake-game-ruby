require "ruby2d"

module View
    class Ruby2dView
        def initialize(app)
            @pixel_size = 50
            @app = app
        end

        def start(state)
            extend Ruby2D::DSL
            set(title: "Snake Game", 
                width: @pixel_size * state.grid.cols,
                height: @pixel_size * state.grid.rows
            )
            on :key_down do |event|
                handle_key_event(event)
            end
            show
        end

        def render(state)
            clear
            render_food(state)
            render_snake(state)
        end

        private 

        def render_food(state)
            extend Ruby2D::DSL
            food = state.food
            Square.new(
                x: food.col * @pixel_size,
                y: food.row * @pixel_size,
                size: @pixel_size,
                color: 'orange'
            )
        end

        def render_snake(state)
            extend Ruby2D::DSL
            snake = state.snake
            snake.positions.each do |pos|
                Square.new(
                    x: pos.col * @pixel_size,
                    y: pos.row * @pixel_size,
                    size: @pixel_size,
                    color: 'green'
                )
            end
        end
        
        def handle_key_event(event)
            case event.key
            when "up"
                # Cambiar dirección hacía arriba
                @app.send_action(:change_direction, Model::Direction::UP)
            when "down"
                # Cambiar dirección hacía abajo
                @app.send_action(:change_direction, Model::Direction::DOWN)
            when "right"
                # Cambiar dirección hacía la derecha
                @app.send_action(:change_direction, Model::Direction::RIGHT)
            when "left"
                # Cambiar dirección hacía la izquierda
                @app.send_action(:change_direction, Model::Direction::LEFT)
            end
        end
    end
end