require "minitest/autorun"
require_relative "../src/actions/actions.rb"
require_relative "../src/model/state.rb"

class ActionTest < Minitest::Test
    def test_move_snake
        initial_state = Model::State.new(
            Model::Snake.new([
                Model::Coordinate.new(1,1),
                Model::Coordinate.new(1,0)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )

        expected_state = Model::State.new(
            Model::Snake.new([
                Model::Coordinate.new(2,1),
                Model::Coordinate.new(1,1)
            ]),
            Model::Food.new(4,4),
            Model::Grid.new(8,12),
            Model::Direction::DOWN,
            false
        )

        actual_state = Actions::move_snake(initial_state)
        assert_equal(actual_state, expected_state)
    end
end