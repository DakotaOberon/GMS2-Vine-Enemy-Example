#region Bend / Remove this region to gradual bending

if (parent != noone) {
	// Get target dir, use point direction to aim toward any target
	var target_dir = point_direction(x, y, mouse_x, mouse_y);

	// Get angle difference between mouse direction and parent rotation
	var dir_diff = angle_difference(target_dir, parent.image_angle);

	// Fix differences outside of max rotation
	if (abs(dir_diff) > max_rotation) {
		// Clamp dir diff to max_rotation
		dir_diff = sign(dir_diff) * max_rotation;
	}

	// Set image_angle to parent + diff
	image_angle = parent.image_angle + dir_diff;
	
	if (index > count) {
		instance_destroy();
	}
} else {
	// If root of spine, give count control
	if (mouse_wheel_up()) {
		count += 1;
	} else if (mouse_wheel_down()) {
		count -= 1;
	}
}

#endregion

#region Anchor child

if (child != noone) {
	// Set child anchor point
	child.x = x + lengthdir_x(sprite_width, image_angle);
	child.y = y + lengthdir_y(sprite_width, image_angle);

	// Update child count
	child.count = count;
} else if (index < count) {
	// Set child anchor point
	next_x = x + lengthdir_x(sprite_width, image_angle);
	next_y = y + lengthdir_y(sprite_width, image_angle);

	// Create a child spine object
	child = instance_create_layer(next_x, next_y, layer, oSpineFluid);

	// Set parent
	child.parent = self;

	// Set child index
	child.index = index + 1;
}

#endregion
