class ToyRobotCalculator

  TURN = ["LEFT", "RIGHT"]
  DIRECTION = ["NORTH", "WEST", "SOUTH", "EAST"]


  # Lets start this robot
  def initialize(position_x = 0, position_y = 0, direction = 'NORTH')
    @position_x, @position_y = position_x, position_y
    @direction = direction
  end

  def calculate_command(command)
    rotate_robot(command) if TURN.include? command
    move_robot() if command.eql?('MOVE')
    [@position_x, @position_y, @direction]
  end

  def rotate_robot(command)
    index = DIRECTION.find_index(@direction)
    if command.eql?("LEFT")
      if index == 3
        @direction = 'NORTH'
      else
        @direction =  DIRECTION[index + 1]
      end
    else
      if index == 0
        @direction = 'EAST'
      else
        @direction =  DIRECTION[index - 1]
      end
    end
  end

  def move_robot
    if @direction.eql?('NORTH')
      @position_y = @position_y + 1
    elsif @direction.eql?('WEST')
      @position_x = @position_x - 1
    elsif @direction.eql?('EAST')
      @position_x = @position_x + 1
    elsif @direction.eql?('SOUTH')
      @position_y = @position_y - 1
    end
  end
end