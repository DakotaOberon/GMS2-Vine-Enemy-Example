// Root object
parent = noone;

// Next object
child = noone;

// Index in chain
index = 0;

// Max children
count = 4;

// Max bend per child
max_rotation = 10;

// Set child anchor point
next_x = x + lengthdir_x(sprite_width, image_angle);
next_y = y + lengthdir_y(sprite_width, image_angle);

// Added for fun
image_blend = make_color_hsv(irandom(255), 255, 255);

