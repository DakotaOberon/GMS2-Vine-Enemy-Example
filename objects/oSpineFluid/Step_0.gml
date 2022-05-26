#region Bend / Remove this region to gradual bending

if (parent != noone) {
	// Get angle difference between mouse direction and parent rotation
	var dir_diff = angle_difference(point_direction(x, y, mouse_x, mouse_y), parent.image_angle);

	// Fix differences outside of max rotation
	if (abs(dir_diff) > max_rotation) {
		// Clamp dir diff to max_rotation
		dir_diff = sign(dir_diff) * max_rotation;
	}

	// Set image_angle to parent + diff
	image_angle = parent.image_angle + dir_diff;
}

#endregion

#region Anchor child

if (child != noone) {
	child.x = x + lengthdir_x(sprite_width, image_angle);
	child.y = y + lengthdir_y(sprite_width, image_angle);
}

#endregion
