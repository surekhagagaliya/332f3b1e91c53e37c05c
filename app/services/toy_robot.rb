class ToyRobot

  def self.calculate(input)
    # Create the array for the movements
    all_command = input.gsub(/[\[\]]/, '').split("', ").map{|a| a.gsub("'", '')}
    movements = all_command[0]
    position = movements.gsub("PLACE ","").gsub(",","").gsub(" ","") if movements.start_with?("PLACE ")
    # Create an instance of the Robot Calculator
    robot = ToyRobotCalculator.new(position[0].to_i, position[1].to_i, position[2..-1].upcase)

    # Move the robot around
    final_result = ''
    all_command[1..-1].each do |movement|
      final_result = robot.calculate_command(movement)
    end

    # Sends back the final position!
    return final_result
  end
end