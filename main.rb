#!/usr/bin/ruby

require "ruby2d"

#########################
# Set window properties #
#########################

set title: "Easy Physics"
set resizable: false
set background: 'red'
set width: 1280
set height: 720
set diagnostics: true

###############################
# Init some objects on screen #
###############################

ball = Circle.new(
    x: 1280/2, 
    y: 720/2-30, 
    radius: 10, 
    color: 'black'
)

platform = Line.new(
    x1: 300, y1: 600,
    x2: 1000, y2: 600,
    width: 25,
    color: 'black',
    z: 10
)

text_collision = Text.new("Collisions:")
text_gravity = Text.new(
    "Gravity:",
    y: text_collision.y + 20
)

#########################
# Some global variables #
#########################

$velocity_y = 0
$velocity_x = 0
$gravity = 0.5
$tick = 0

###########
# Physics #
###########

update do
    if $tick % 1 == 0    
        # Collisions
        if ball.x > platform.x1 
            if ball.x < platform.x2 
                if ball.y == 594.0 or ball.y == 595.0
                    $velocity_y = -$velocity_y + $gravity
                end 
            end
        end

        # Gravity
        $velocity_y += $gravity

        ball.y += $velocity_y
        ball.x += $velocity_x
    end

    $tick += 1
end

###############
# Show window #
###############

show