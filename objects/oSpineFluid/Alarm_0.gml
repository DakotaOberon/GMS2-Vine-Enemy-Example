// If index is less than count
if (index < count) {
	// Create a child spine object
	child = instance_create_layer(next_x, next_y, layer, oSpineFluid);

	// Set parent
	child.parent = self;

	// Set child index
	child.index = index + 1;
}

