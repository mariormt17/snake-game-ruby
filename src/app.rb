require_relative "view/ruby2d"
require_relative "model/state"

class App
    def start
        initial_state = Model::initial_state
        view = View::Ruby2dView.new
        view.render(initial_state)
    end

    def init_timer
        loop do
            sleep 0.5
        end
    end
end