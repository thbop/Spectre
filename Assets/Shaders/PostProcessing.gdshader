shader_type canvas_item;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;



float BadMagnitude( vec4 p ) {
	return (p.x + p.y + p.z) * p.w;
}



const float kernelSize = 2.0;
const float boxBlurDivsor = 25.0; // pow( 2.0 * kernelSize + 1.0, 2.0 );

void fragment() {
	vec4 tex = texture(screen_texture, UV);

	
	COLOR = tex;
}
