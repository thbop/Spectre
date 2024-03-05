shader_type canvas_item;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;

uniform float crt_curve: hint_range(0.0, 1.0) = 0.05;

void fragment() {
	vec2 crt_curve_shift = (vec2(1.0) - sin(UV.yx * PI)) * crt_curve;
	vec2 crt_curve_scale = vec2(1.0) + crt_curve_shift * 2.0;
	
	vec4 tex = texture(screen_texture, UV * crt_curve_scale - crt_curve_shift);
	
	COLOR = tex;
}
